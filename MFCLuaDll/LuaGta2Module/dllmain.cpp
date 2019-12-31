// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"
#define LUA_LIB
extern "C" {
    #include "lua.h"
    #include "lauxlib.h"
}

#pragma comment(lib, "lua51")
    //#include "lua.hpp"

static int gta_hello_world(lua_State* L) {
    lua_pushnumber(L, 42);
    return 1;
}

static const luaL_Reg gtalib[] = {
        {"hello",   gta_hello_world},
        {NULL, NULL}
};

LUALIB_API int luaopen_gta(lua_State* L) {
    luaL_register(L, "gta", gtalib);
    lua_pushnumber(L, 3.14);
    lua_setfield(L, -2, "pi");
    return 1;
}

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
                     )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}

