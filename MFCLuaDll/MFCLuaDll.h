// MFCLuaDll.h : main header file for the MFCLuaDll DLL
//

#pragma once

#ifndef __AFXWIN_H__
	#error "include 'pch.h' before including this file for PCH"
#endif

#include "resource.h"		// main symbols
#include "CMainWindow.h"


// CMFCLuaDllApp
// See MFCLuaDll.cpp for the implementation of this class
//

class CMFCLuaDllApp : public CWinApp
{
public:
	CMFCLuaDllApp();

// Overrides
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
private:
	CMainWindow* m_pMainWnd;
};
