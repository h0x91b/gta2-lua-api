#pragma once


// CMainWindow dialog

class CMainWindow : public CDialogEx
{
	DECLARE_DYNAMIC(CMainWindow)

public:
	CMainWindow(CWnd* pParent = nullptr);   // standard constructor
	virtual ~CMainWindow();

// Dialog Data
#ifdef AFX_DESIGN_TIME
	enum { IDD = IDD_DIALOG1 };
#endif

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedOk();
	afx_msg void OnBnClickedCancel();
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	CEdit m_log;
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	void log(const wchar_t* format, ...);
	void LoadLuaScript(const wchar_t* file);
	afx_msg void OnBnClickedButton1();
	afx_msg void OnPaint();
	HWND m_gtaWindow;
};
