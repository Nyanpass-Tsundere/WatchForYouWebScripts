# WatchForYouWebScripts

這邊提供一台Linux要一直開啟網頁管理界面，所需要的Script。

安裝好X11環境、xrandr、xdotool與firefox後，把`10-monitor.conf`放到`/etc/X11/xorg.conf.d/`讓螢幕不會自動關閉，啟用[getty的自動登入](https://wiki.archlinux.org/index.php/automatic_login_to_virtual_console)後。

自動登入設定後，將`bashrc`用來取代自動登入使用者的`.bashrc` （如果使用者的預設shell不是bash請記得更換），讓使用者自動登入後就執行`startx`與其他相關指令。自動登入的使用者必須有權限開啟硬體設備並啟動X11環境，目前找到的最快解是加入wheel群組（汗顏）。

最後再用`xinitrc`取代使用者的`.xinitrc`，`xinitrc`的前40行是從系統的`/etc/X11/xinit/xinitrc`複製過來的，不複製過來滑鼠游標會消失。

## 使用效果
[請參考影片](https://youtu.be/DIxJvmG4fhg)
<iframe width="560" height="315" src="https://www.youtube.com/embed/DIxJvmG4fhg" frameborder="0" allowfullscreen></iframe>

## 已知問題

1. Firefox在沒有WM的狀況下，選單叫不出來
