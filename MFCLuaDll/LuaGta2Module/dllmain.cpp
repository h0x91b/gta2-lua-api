// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"
#define LUA_LIB
//#include "lua.hpp"
extern "C" {
    //#include "lua.h"
//    #include "lauxlib.h"

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

}

#pragma comment(lib, "lua-5.3.5.lib")
    //#include "lua.hpp"

static int gta_hello_world(lua_State* L) {
    lua_pushstring(L, "GTA module hello world");
    return 1;
}

static const luaL_Reg gtalib[] = {
        {"hello",   gta_hello_world},
        {NULL, NULL}
};

__declspec(dllexport) int luaopen_gta(lua_State* L) {
    luaL_newlib(L, gtalib);
    return 1;
}

/*
LUALIB_API int luaopen_gta(lua_State* L) {
    luaL_newlibtable(L, gtalib);
    lua_newtable(L);
    lua_pushnumber(L, 42);
    lua_setfield(L, -2, "foo");
    luaL_setfuncs(L, gtalib, 1);

    return 1;
}
*/

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

