#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# LC_ALL > LC_* >LANG
# LANGUAGE - Most programs use this for the language of its interface
# 1、语言符号及其分类(LC_CTYPE)
# 2、数字(LC_NUMERIC)
# 3、比较和排序习惯(LC_COLLATE)
# 4、时间显示格式(LC_TIME)
# 5、货币单位(LC_MONETARY)
# 6、信息主要是提示信息,错误信息,状态信息,标题,标签,按钮和菜单等(LC_MESSAGES)
# 7、姓名书写方式(LC_NAME)
# 8、地址书写方式(LC_ADDRESS)
# 9、电话号码书写方式(LC_TELEPHONE)
# 10、度量衡表达方式 (LC_MEASUREMENT)
# 11、默认纸张尺寸大小(LC_PAPER)
# 12、对locale自身包含信息的概述(LC_IDENTIFICATION)。
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
# LC_CTYPE must be zh_CN.UTF-8 to enable fcitx for emacs, though i don't need that
# set LC_CTYPE as other values with im set up, fcitx will be invoked too.
# just that nothing will be returned from fcitx
export LC_CTYPE=zh_CN.UTF-8
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
# use zh_CN messages to use Chinese man pages
# 几乎所有中文的 man pages 都是过时的，所以打开这个选项意义不大
export LC_MESSAGES="zh_CN.UTF-8"
export LC_PAPER="zh_CN.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="zh_CN.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL=

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

export EDITOR="emacsclient -nw"
export VISUAL="emacsclient -nw"

exec startplasma-x11
