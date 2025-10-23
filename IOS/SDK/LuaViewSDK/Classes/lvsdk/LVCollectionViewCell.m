/**
  * Created by LuaView.
  * Copyright (c) 2017, Alibaba Group. All rights reserved.
  *
  * This source code is licensed under the MIT.
  * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
  */

#import "LVCollectionViewCell.h"
#import "LVHeads.h"
#import "LView.h"

// Why import lapi.h here ? LVHeads.h not enough ???
//#import "lapi.h"

@interface LVCollectionViewCell ()
@property (nonatomic,weak) LuaViewCore* lv_luaviewCore;
@end



@implementation LVCollectionViewCell


-(void) dealloc{
    lua_State* L = self.lv_luaviewCore.l;
    if( L ) {
        [LVUtil unregistry:L key:self];
    }
}

//-(void) doInitWithLView:(LuaViewCore*) lview{
//    self.lv_luaviewCore = lview;
//    lua_State* L = lview.l;
//    if( L ) {
//        // 1️⃣ Create Lua table for this cell
//        lua_createtable(L, 0, 0);
//        
//        
//        // 2️⃣ Store table in registry by 'self' pointer
//        [LVUtil registryValue:L key:self stack:-1];
//        
//        
//        // 6️⃣ Add weak 'window' field
//        lv_luaTableSetWeakWindow(L, self.contentView);
//        
//    }
//}

-(void) doInitWithLView:(LuaViewCore*) lview {
    self.lv_luaviewCore = lview;
    lua_State* L = lview.l;
    if (L) {
        lua_createtable(L, 0, 0);       // table at -1
        int tableIndex = lua_gettop(L); // save index
        
        // Add weak 'window' field
        lv_luaTableSetWeakWindow(L, self.contentView); // modifies table at tableIndex
        
        // Store table in registry keyed by self
        [LVUtil registryValue:L key:self stack:tableIndex];
        
        lua_pop(L, 1); // clean stack
    }
}

-(void) pushTableToStack {
    lua_State* L = self.lv_luaviewCore.l;
    if (L) {
        // Push the Lua table associated with this cell
        lua_pushlightuserdata(L, (__bridge void *)(self)); // key
        lua_gettable(L, LUA_REGISTRYINDEX);               // push registry[key] (the table) onto stack
    }
}


-(NSString*) description{
    return [NSString stringWithFormat:@"<CollectionViewCell(0x%x) frame = %@>", (int)[self hash], NSStringFromCGRect(self.frame)];
}

- (void) layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect = self.frame;
    NSArray* subviews = [self.contentView subviews];
    for( UIView* view in subviews){
        [view lv_alignSelfWithSuperRect:rect];
    }
}

// 修复gif图片滚动会消失问题
-(void) prepareForReuse{
}

@end
