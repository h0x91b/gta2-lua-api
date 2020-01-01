// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"
#define LUA_LIB

extern "C" {
    #include <lua.h>
    #include <lualib.h>
    #include <lauxlib.h>
}

#pragma comment(lib, "lua-5.3.5.lib")


bool IsBadReadPtr(void* p)
{
    MEMORY_BASIC_INFORMATION mbi = { 0 };
    if (::VirtualQuery(p, &mbi, sizeof(mbi)))
    {
        DWORD mask = (PAGE_READONLY | PAGE_READWRITE | PAGE_WRITECOPY | PAGE_EXECUTE_READ | PAGE_EXECUTE_READWRITE | PAGE_EXECUTE_WRITECOPY);
        bool b = !(mbi.Protect & mask);
        // check the page is not a guard page
        if (mbi.Protect & (PAGE_GUARD | PAGE_NOACCESS)) b = true;

        return b;
    }
    return true;
}

bool IsBadWritePtr(void* p)
{
    MEMORY_BASIC_INFORMATION mbi = { 0 };
    if (::VirtualQuery(p, &mbi, sizeof(mbi)))
    {
        DWORD mask = (PAGE_READWRITE | PAGE_WRITECOPY | PAGE_EXECUTE_READWRITE | PAGE_EXECUTE_WRITECOPY);
        bool b = !(mbi.Protect & mask);
        // check the page is not a guard page
        if (mbi.Protect & (PAGE_GUARD | PAGE_NOACCESS)) b = true;

        return b;
    }
    return true;
}

// dest, src
static int gta_write_memory(lua_State* L) {
    void *src, *dest;
    size_t size;

    int argc = lua_gettop(L);
    if (argc != 2) {
        lua_pushliteral(L, "must be 2 arguments");
        lua_error(L);
        return 0;
    }

    if (!lua_isinteger(L, 1)) {
        lua_pushliteral(L, "1st argument must be an integer (dest)");
        lua_error(L);
        return 0;
    }

    if (!lua_isstring(L, 2)) {
        lua_pushliteral(L, "2st argument must be a string (src)");
        lua_error(L);
        return 0;
    }

    dest = (void*)lua_tointeger(L, 1);
    src = (void*)lua_tolstring(L, 2, &size);

    if (IsBadWritePtr(dest)) {
        lua_pushboolean(L, 0);
        lua_pushliteral(L, "ptr is invalid");
        return 2;
    }

    memcpy(dest, src, size);
    lua_pushboolean(L, 1);
    lua_pushlstring(L, (const char*)dest, size);

    return 2;
}

static int gta_read_memory(lua_State* L) {
    void* ptr;
    size_t size;

    int argc = lua_gettop(L);
    if (argc != 2) {
        lua_pushliteral(L, "must be 2 arguments");
        lua_error(L);
        return 0;
    }

    if (!lua_isinteger(L, 1)) {
        lua_pushliteral(L, "1st argument must be an integer");
        lua_error(L);
        return 0;
    }

    if (!lua_isinteger(L, 2)) {
        lua_pushliteral(L, "2st argument must be an integer");
        lua_error(L);
        return 0;
    }

    ptr = (void*)lua_tointeger(L, 1);
    size = (size_t)lua_tointeger(L, 2);

    if (IsBadReadPtr(ptr)) {
        lua_pushboolean(L, 0);
        lua_pushliteral(L, "ptr is invalid");
        return 2;
    }


    lua_pushboolean(L, 1);
    lua_pushlstring(L, (const char*)ptr, size);

    return 2;
}

static int gta_hello_world(lua_State* L) {
    lua_pushstring(L, "GTA module hello world");
    return 1;
}

static const luaL_Reg gtalib[] = {
        {"hello",   gta_hello_world},
        {"read_memory", gta_read_memory},
        {"write_memory", gta_write_memory},
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

