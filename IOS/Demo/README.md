#  <#Title#>


# Dev Log


2025-10-21

Integrate lua_ios.xcframework(Lua 5.3.4) and ios_system.xcframework

- modify LuaViewSDK podspec, depend on lua_ios
- refactor LuaViewSDK source code to compatible with lua 5.3.4
    - LuaViewSDK use many private header files, replace them with public API
    - from 5.1 to 5.3, there are many API changes (Heavy work), see git commit
    
