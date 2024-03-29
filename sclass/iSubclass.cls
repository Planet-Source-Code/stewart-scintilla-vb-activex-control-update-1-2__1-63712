VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "iSubclass"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'*************************************************************************************************
'* iSubclass - cSubclass' implementation interface class + enumerations
'*
'* Paul_Caton@hotmail.com
'* Copyright free, use and abuse as you see fit.
'*
'* v1.0 The original..................................................................... 20060322
'*************************************************************************************************

Option Explicit

'When to callback enumeration
Public Enum eMsgWhen_iSC                                                    'When to callback
  MSG_BEFORE = 1                                                            'Callback before the original WndProc
  MSG_AFTER = 2                                                             'Callback after the original WndProc
  MSG_BEFORE_AFTER = MSG_BEFORE Or MSG_AFTER                                'Callback before and after the original WndProc
End Enum

'Windows message values
'Public Enum eMsg_iSC
'  ALL_MESSAGES = -1
'  WM_NULL = &H0
'  WM_CREATE = &H1
'  WM_DESTROY = &H2
'  WM_MOVE = &H3
'  WM_SIZE = &H5
'  WM_ACTIVATE = &H6
'  WM_SETFOCUS = &H7
'  WM_KILLFOCUS = &H8
'  WM_ENABLE = &HA
'  WM_SETREDRAW = &HB
'  WM_SETTEXT = &HC
'  WM_GETTEXT = &HD
'  WM_GETTEXTLENGTH = &HE
'  WM_PAINT = &HF
'  WM_CLOSE = &H10
'  WM_QUERYENDSESSION = &H11
'  WM_QUIT = &H12
'  WM_QUERYOPEN = &H13
'  WM_ERASEBKGND = &H14
'  WM_SYSCOLORCHANGE = &H15
'  WM_ENDSESSION = &H16
'  WM_SHOWWINDOW = &H18
'  WM_WININICHANGE = &H1A
'  WM_SETTINGCHANGE = &H1A
'  WM_DEVMODECHANGE = &H1B
'  WM_ACTIVATEAPP = &H1C
'  WM_FONTCHANGE = &H1D
'  WM_TIMECHANGE = &H1E
'  WM_CANCELMODE = &H1F
'  WM_SETCURSOR = &H20
'  WM_MOUSEACTIVATE = &H21
'  WM_CHILDACTIVATE = &H22
'  WM_QUEUESYNC = &H23
'  WM_GETMINMAXINFO = &H24
'  WM_PAINTICON = &H26
'  WM_ICONERASEBKGND = &H27
'  WM_NEXTDLGCTL = &H28
'  WM_SPOOLERSTATUS = &H2A
'  WM_DRAWITEM = &H2B
'  WM_MEASUREITEM = &H2C
'  WM_DELETEITEM = &H2D
'  WM_VKEYTOITEM = &H2E
'  WM_CHARTOITEM = &H2F
'  WM_SETFONT = &H30
'  WM_GETFONT = &H31
'  WM_SETHOTKEY = &H32
'  WM_GETHOTKEY = &H33
'  WM_QUERYDRAGICON = &H37
'  WM_COMPAREITEM = &H39
'  WM_GETOBJECT = &H3D
'  WM_COMPACTING = &H41
'  WM_WINDOWPOSCHANGING = &H46
'  WM_WINDOWPOSCHANGED = &H47
'  WM_POWER = &H48
'  WM_COPYDATA = &H4A
'  WM_CANCELJOURNAL = &H4B
'  WM_NOTIFY = &H4E
'  WM_INPUTLANGCHANGEREQUEST = &H50
'  WM_INPUTLANGCHANGE = &H51
'  WM_TCARD = &H52
'  WM_HELP = &H53
'  WM_USERCHANGED = &H54
'  WM_NOTIFYFORMAT = &H55
'  WM_CONTEXTMENU = &H7B
'  WM_STYLECHANGING = &H7C
'  WM_STYLECHANGED = &H7D
'  WM_DISPLAYCHANGE = &H7E
'  WM_GETICON = &H7F
'  WM_SETICON = &H80
'  WM_NCCREATE = &H81
'  WM_NCDESTROY = &H82
'  WM_NCCALCSIZE = &H83
'  WM_NCHITTEST = &H84
'  WM_NCPAINT = &H85
'  WM_NCACTIVATE = &H86
'  WM_GETDLGCODE = &H87
'  WM_SYNCPAINT = &H88
'  WM_NCMOUSEMOVE = &HA0
'  WM_NCLBUTTONDOWN = &HA1
'  WM_NCLBUTTONUP = &HA2
'  WM_NCLBUTTONDBLCLK = &HA3
'  WM_NCRBUTTONDOWN = &HA4
'  WM_NCRBUTTONUP = &HA5
'  WM_NCRBUTTONDBLCLK = &HA6
'  WM_NCMBUTTONDOWN = &HA7
'  WM_NCMBUTTONUP = &HA8
'  WM_NCMBUTTONDBLCLK = &HA9
'  WM_KEYFIRST = &H100
'  WM_KEYDOWN = &H100
'  WM_KEYUP = &H101
'  WM_CHAR = &H102
'  WM_DEADCHAR = &H103
'  WM_SYSKEYDOWN = &H104
'  WM_SYSKEYUP = &H105
'  WM_SYSCHAR = &H106
'  WM_SYSDEADCHAR = &H107
'  WM_KEYLAST = &H108
'  WM_IME_STARTCOMPOSITION = &H10D
'  WM_IME_ENDCOMPOSITION = &H10E
'  WM_IME_COMPOSITION = &H10F
'  WM_IME_KEYLAST = &H10F
'  WM_INITDIALOG = &H110
'  WM_COMMAND = &H111
'  WM_SYSCOMMAND = &H112
'  WM_TIMER = &H113
'  WM_HSCROLL = &H114
'  WM_VSCROLL = &H115
'  WM_INITMENU = &H116
'  WM_INITMENUPOPUP = &H117
'  WM_MENUSELECT = &H11F
'  WM_MENUCHAR = &H120
'  WM_ENTERIDLE = &H121
'  WM_MENURBUTTONUP = &H122
'  WM_MENUDRAG = &H123
'  WM_MENUGETOBJECT = &H124
'  WM_UNINITMENUPOPUP = &H125
'  WM_MENUCOMMAND = &H126
'  WM_CTLCOLORMSGBOX = &H132
'  WM_CTLCOLOREDIT = &H133
'  WM_CTLCOLORLISTBOX = &H134
'  WM_CTLCOLORBTN = &H135
'  WM_CTLCOLORDLG = &H136
'  WM_CTLCOLORSCROLLBAR = &H137
'  WM_CTLCOLORSTATIC = &H138
'  WM_MOUSEFIRST = &H200
'  WM_MOUSEMOVE = &H200
'  WM_LBUTTONDOWN = &H201
'  WM_LBUTTONUP = &H202
'  WM_LBUTTONDBLCLK = &H203
'  WM_RBUTTONDOWN = &H204
'  WM_RBUTTONUP = &H205
'  WM_RBUTTONDBLCLK = &H206
'  WM_MBUTTONDOWN = &H207
'  WM_MBUTTONUP = &H208
'  WM_MBUTTONDBLCLK = &H209
'  WM_MOUSEWHEEL = &H20A
'  WM_PARENTNOTIFY = &H210
'  WM_ENTERMENULOOP = &H211
'  WM_EXITMENULOOP = &H212
'  WM_NEXTMENU = &H213
'  WM_SIZING = &H214
'  WM_CAPTURECHANGED = &H215
'  WM_MOVING = &H216
'  WM_DEVICECHANGE = &H219
'  WM_MDICREATE = &H220
'  WM_MDIDESTROY = &H221
'  WM_MDIACTIVATE = &H222
'  WM_MDIRESTORE = &H223
'  WM_MDINEXT = &H224
'  WM_MDIMAXIMIZE = &H225
'  WM_MDITILE = &H226
'  WM_MDICASCADE = &H227
'  WM_MDIICONARRANGE = &H228
'  WM_MDIGETACTIVE = &H229
'  WM_MDISETMENU = &H230
'  WM_ENTERSIZEMOVE = &H231
'  WM_EXITSIZEMOVE = &H232
'  WM_DROPFILES = &H233
'  WM_MDIREFRESHMENU = &H234
'  WM_IME_SETCONTEXT = &H281
'  WM_IME_NOTIFY = &H282
'  WM_IME_CONTROL = &H283
'  WM_IME_COMPOSITIONFULL = &H284
'  WM_IME_SELECT = &H285
'  WM_IME_CHAR = &H286
'  WM_IME_REQUEST = &H288
'  WM_IME_KEYDOWN = &H290
'  WM_IME_KEYUP = &H291
'  WM_MOUSEHOVER = &H2A1
'  WM_MOUSELEAVE = &H2A3
'  WM_CUT = &H300
'  WM_COPY = &H301
'  WM_PASTE = &H302
'  WM_CLEAR = &H303
'  WM_UNDO = &H304
'  WM_RENDERFORMAT = &H305
'  WM_RENDERALLFORMATS = &H306
'  WM_DESTROYCLIPBOARD = &H307
'  WM_DRAWCLIPBOARD = &H308
'  WM_PAINTCLIPBOARD = &H309
'  WM_VSCROLLCLIPBOARD = &H30A
'  WM_SIZECLIPBOARD = &H30B
'  WM_ASKCBFORMATNAME = &H30C
'  WM_CHANGECBCHAIN = &H30D
'  WM_HSCROLLCLIPBOARD = &H30E
'  WM_QUERYNEWPALETTE = &H30F
'  WM_PALETTEISCHANGING = &H310
'  WM_PALETTECHANGED = &H311
'  WM_HOTKEY = &H312
'  WM_PRINT = &H317
'  WM_PRINTCLIENT = &H318
'  WM_THEMECHANGED = &H31A
'  WM_HANDHELDFIRST = &H358
'  WM_HANDHELDLAST = &H35F
'  WM_AFXFIRST = &H360
'  WM_AFXLAST = &H37F
'  WM_PENWINFIRST = &H380
'  WM_PENWINLAST = &H38F
'  WM_USER = &H400
'  WM_APP = &H8000
'End Enum

Sub WndProc(ByVal bBefore As Boolean, ByRef bHandled As Boolean, ByRef lReturn As Long, ByVal lng_hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long)
'*************************************************************************************************
'* bBefore  - Indicates whether the callback is before or after the original WndProc. Usually you
'*            will know unless the callback for the uMsg value is specified as MSG_BEFORE_AFTER
'*            (both before and after the original WndProc).
'* bHandled - In a before original WndProc callback, setting bHandled to True will prevent the
'*            message being passed to the original WndProc and (if set to do so) the after
'*            original WndProc callback.
'* lReturn  - WndProc return value. Set as per the MSDN documentation for the message value,
'*            and/or, in an after the original WndProc callback, act on the return value as set
'*            by the original WndProc.
'* hWnd     - Window handle.
'* uMsg     - Message value.
'* wParam   - Message related data.
'* lParam   - Message related data.
'*************************************************************************************************
End Sub

