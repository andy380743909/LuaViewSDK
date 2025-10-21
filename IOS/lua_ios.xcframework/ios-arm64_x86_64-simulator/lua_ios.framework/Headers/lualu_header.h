//
//  lualu_header.h
//  lua_ios
//
//  Created by cuipanjun on 12/26/23.
//  Copyright © 2023 Nicolas Holzschuch. All rights reserved.
//

#ifndef lualu_header_h
#define lualu_header_h

#include <string.h>

#include "lauxlib.h"

#include "lfs.h"

// Add by andy cui
#define LUA_LFSLIBNAME    "lfs"
LUAMOD_API int (luaopen_lfs) (lua_State *L);

#define LUA_SOCKETLIBNAME    "socket.core"
LUAMOD_API int (luaopen_socket_core) (lua_State *L);

#define LUA_MIMELIBNAME    "mime.core"
LUAMOD_API int (luaopen_mime_core) (lua_State *L);

#define LUA_SOCKETSERIALLIBNAME    "socket.serial"
LUAMOD_API int (luaopen_socket_serial) (lua_State *L);

#define LUA_SOCKETUNIXLIBNAME    "socket.unix"
LUAMOD_API int (luaopen_socket_unix) (lua_State *L);

#define LUA_SQLITE3LIBNAME    "lsqlite3"
LUAMOD_API int (luaopen_lsqlite3) (lua_State *L);

#define LUA_CJSONLIBNAME    "cjson"
LUAMOD_API int (luaopen_cjson) (lua_State *L);
#define LUA_CJSONSAFELIBNAME    "cjson.safe"
LUAMOD_API int (luaopen_cjson_safe) (lua_State *L);

void setAllowedPreloadLibs(char**);

typedef void (*luaL_openlibs_preload_hook)(lua_State *, const char*);
void setShouldPreloadLibHook(luaL_openlibs_preload_hook hook);

typedef void (*luaL_openlibs_hook)(lua_State *);
void setHook(luaL_openlibs_hook hook);



/*
** these libs are preloaded and must be required before used
*/
//static luaL_Reg preloadedlibs[] = {
//    {LUA_LFSLIBNAME, luaopen_lfs},
//    {LUA_SOCKETLIBNAME, luaopen_socket_core},
//    {LUA_MIMELIBNAME, luaopen_mime_core},
//    {NULL, NULL}
//};

// Function to check if a char* array contains a specific char*
static int containsString(char* arr[], const char* target) {
    if (arr == NULL || target == NULL) {
        return 0;
    }
    for (int i = 0; arr[i] != NULL; ++i) {
        if (strcmp(arr[i], target) == 0) {
            return 1;  // Found the target string in the array
        }
    }
    return 0;  // Target string not found
}

#endif /* lualu_header_h */
