#Requires AutoHotkey v2.0
#SingleInstance Force

VIP_LINK := "YOUR_SERVER_LINK_OR_LINK_TO_TWISTED"

; ============== HOTKEYS ==============
F2:: JoinVIP()

; ============== JOIN VIP ==============
JoinVIP() {
    Run 'chrome.exe "' VIP_LINK '"'
    
    ToolTip "Opening VIP in Chrome...", 100, 100
    Sleep 5000

    ; Close Chrome tab
    if WinExist("ahk_exe chrome.exe")
        WinActivate "ahk_exe chrome.exe"
    Sleep 200
    Send "^w"

    ToolTip "Switching to Roblox window...", 100, 100
    Sleep 5000

    ; === Force Roblox to be active and on top ===
    if WinExist("ahk_exe RobloxPlayerBeta.exe")
        WinActivate "ahk_exe RobloxPlayerBeta.exe"
    else if WinExist("ahk_exe ApplicationFrameHost.exe")
        WinActivate "ahk_exe ApplicationFrameHost.exe"
    else if WinExist("Roblox")
        WinActivate "Roblox"

    ; Extra safety: Bring it to the foreground and restore if minimized

    Sleep 2000               ; Wait 1.5 seconds with Roblox on top
    MouseMove 200, 318
    Sleep 10
    Click 272, 317                ; Click at your position

    ToolTip "Clicked at 272, 317", 100, 100
    Sleep 1000
    ToolTip
}