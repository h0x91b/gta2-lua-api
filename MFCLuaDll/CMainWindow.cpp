// CMainWindow.cpp : implementation file
//

#include "pch.h"
#include "MFCLuaDll.h"
#include "CMainWindow.h"
#include "afxdialogex.h"

#include <lua.hpp>
#include <stdlib.h>
#include <stdio.h>

#include "reversed/ped.h"

#include <detours.h>

lua_State* L = 0;

static LONG dwSlept = 0;
static VOID(WINAPI* TrueSleep)(DWORD dwMilliseconds) = Sleep;

int __stdcall gbh_BeginScene();
decltype(&gbh_BeginScene) p_gbh_BeginScene;

template<class T>
inline void GetFunc(HINSTANCE hInstance, T& result, const char* name)
{
    result = reinterpret_cast<T>(GetProcAddress(hInstance, name));
}

int hook_gbh_BeginScene() {
    static DWORD lastTick = 0;

    DWORD now = GetTickCount();

    DWORD timeElapsed = now - lastTick;
    float dt = (float)timeElapsed / 1000.0;
    lastTick = now;
    //call lua
    if (L) {
        lua_getglobal(L, "gbh_BeginScene");
        lua_pushnumber(L, dt);
        lua_pcall(L, 1, 1, 0);
        bool rez = lua_toboolean(L, -1);
        lua_pop(L, 1);
    }
    
    return p_gbh_BeginScene();
}

VOID WINAPI TimedSleep(DWORD dwMilliseconds)
{
    // Save the before and after times around calling the Sleep API.
    DWORD dwBeg = GetTickCount();
    TrueSleep(dwMilliseconds);
    DWORD dwEnd = GetTickCount();

    InterlockedExchangeAdd(&dwSlept, dwEnd - dwBeg);
}

// CMainWindow dialog

IMPLEMENT_DYNAMIC(CMainWindow, CDialogEx)

CMainWindow::CMainWindow(CWnd* pParent /*=nullptr*/)
	: CDialogEx(IDD_DIALOG1, pParent)
{
    m_gtaWindow = 0;

    if (DetourIsHelperProcess()) {
        return;
    }

    HMODULE d3ddll = LoadLibrary(L"d3ddll.dll");

    GetFunc(d3ddll, p_gbh_BeginScene, "gbh_BeginScene");

    DetourRestoreAfterWith();

    DetourTransactionBegin();
    DetourUpdateThread(GetCurrentThread());
    DetourAttach(&(PVOID&)TrueSleep, TimedSleep);
    DetourAttach(&(PVOID&)p_gbh_BeginScene, hook_gbh_BeginScene);
    //DetourAttach(&(PVOID&)gbh_BeginScene, hook_gbh_BeginScene);
    DetourTransactionCommit();
}

CMainWindow::~CMainWindow()
{
}

void CMainWindow::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_EDIT1, m_log);
}


BEGIN_MESSAGE_MAP(CMainWindow, CDialogEx)
	ON_BN_CLICKED(IDOK, &CMainWindow::OnBnClickedOk)
	ON_BN_CLICKED(IDCANCEL, &CMainWindow::OnBnClickedCancel)
	ON_WM_CREATE()
	ON_WM_SHOWWINDOW()
    ON_BN_CLICKED(IDC_BUTTON1, &CMainWindow::OnBnClickedButton1)
    ON_WM_PAINT()
END_MESSAGE_MAP()


// CMainWindow message handlers


void CMainWindow::OnBnClickedOk()
{
	// TODO: Add your control notification handler code here
	// CDialogEx::OnOK();
}


void CMainWindow::OnBnClickedCancel()
{
	// TODO: Add your control notification handler code here
	// CDialogEx::OnCancel();
}


int CMainWindow::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CDialogEx::OnCreate(lpCreateStruct) == -1)
		return -1;

	// TODO:  Add your specialized creation code here
	return 0;
}


void CMainWindow::OnShowWindow(BOOL bShow, UINT nStatus)
{
	CDialogEx::OnShowWindow(bShow, nStatus);
	log(L"OnShowWindow");
}


void CMainWindow::log(const wchar_t* format, ...)
{
	va_list args;
	va_start(args, format);
	CString str;
	m_log.GetWindowTextW(str);
	str.AppendFormatV(format, args);
	str.AppendFormat(L"\r\n");
	m_log.SetWindowTextW(str);
    OutputDebugStringW(str);
	va_end(args);
}

CMainWindow* mainWindow;

static int luaLog(lua_State* L) {
    int argc = lua_gettop(L);
    const char* msg = lua_tostring(L, 1);
    mainWindow->log(L"[LUA]: %S", msg);

    return 0;
}

void CMainWindow::LoadLuaScript(const wchar_t* file)
{
    mainWindow = this;
    char buf[1024] = { 0 };
    wchar_t wbuf[1024] = { 0 };
    log(L"LoadLuaScript %s", file);

    int status, result;
    double sum;
    //lua_State* L;

    /*
     * All Lua contexts are held in this structure. We work with it almost
     * all the time.
     */
    L = luaL_newstate();

    GetCurrentDirectory(1024, wbuf);
    log(L"Working dir: %s", wbuf);

    lua_register(L, "log", luaLog);

    luaL_openlibs(L); /* Load Lua libraries */

    /* Load the file containing the script we are going to run */
    sprintf(buf, "scripts\\%ws", file);
    status = luaL_loadfile(L, buf);
    if (status) {
        /* If something went wrong, error message is at the top of */
        /* the stack */
        log(L"Couldn't load file: %S\n", lua_tostring(L, -1));
        return;
    }

    /* Ask Lua to run our little script */
    result = lua_pcall(L, 0, LUA_MULTRET, 0);
    if (result) {
        log(L"Failed to run script: %S\n", lua_tostring(L, -1));
        return;
    }

    /* Get the returned value at the top of the stack (index -1) */
    sum = lua_tonumber(L, -1);

    log(L"Script returned: %i\n", sum);

    lua_pop(L, 1);  /* Take the returned value out of the stack */
    //lua_close(L);   /* Cya, Lua */
}


void CMainWindow::OnBnClickedButton1()
{
    LoadLuaScript(L"script.lua");
}


void CMainWindow::OnPaint()
{
    CPaintDC dc(this); // device context for painting
    
    if (m_gtaWindow == NULL) {
        m_gtaWindow = FindWindowA("WinMain", "GTA2");
    }

    if (m_gtaWindow) {
        CRect rect, rect2;

        GetWindowRect(&rect);
        ::GetWindowRect(m_gtaWindow, &rect2);

        int x = GetSystemMetrics(SM_CXSCREEN) - rect2.Width();

        ::MoveWindow(m_gtaWindow, x, 0, rect2.Width(), rect2.Height(), true);
        MoveWindow(0, 0, rect.Width(), rect.Height(), true);

        InvalidateRect(rect);
    }
}
