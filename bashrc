# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
CDPATH=$CDPATH:~/WorkSpace

PATH=$PATH:$HOME/bin:/usr/sbin:/usr/games/bin # Add RVM to PATH for scripting

# set es as emacsclient -t -a""
alias ec='emacsclient -nc -a ""'
#set emacs as default editor
export HISTTIMEFORMAT='%F %T '
#export EDITOR="ec"
alias mv="mv -i"
#alias cp="cp -i"
#alias rm="rm -i"
#alias rm="trash"

alias ll="ls -al --time-style=long-iso --color=yes"
#alias rm="~/bin/trash"
ls="ls --color=yes"
alias ll="ls -l"
alias l.='ls -a -x|egrep -E ^"\."'
#PS1="\[\e32m\][\u@\h \w]$\[\e[0m\]"
#PS1='Time[\u@\h \W \A#\#]\$'
#PS1='[\u@\h \W \A#\#]\$'
#PS1='[\u@\h \W\[\e[34;35m\](\A#\#)\[\e[0m\]]\$'
#PS1='[\u@\h \W\[\e[34;35m\](\A#\#)\[\e[0m\]]\[\e[31;41m\]\$\[\e[0m\]'
#PS1='[\u@\h \W\[\e[34;35m\](\A#\#)\[\e[0m\]]\[\e[31;99m\]\$\[\e[0m\]'
#PS1='\[\e[34;35m\](\A#\#)\[\e[0m\][\u@\h \W]\[\e[31;99m\]\$\[\e[0m\]'
#PS1='\[\e[34;35m\][\A#\#]\[\e[0m\][\u@\h\[\e[34;99m\]\W\[\e[0m\]]\[\e[31;99m\]\$\[\e[0m\]'

#good PS1
#PS1='\[\e[34;35m\]\A#\#\[\e[0m\][\u@\h\[\e[34;99m\]\W\[\e[0m\]]\[\e[31;99m\]\$\[\e[0m\]'
PS1='\[\e[34;35m\]\A\[\e[0m\][\u@\[\e[34;99m\]\W\[\e[0m\]]\[\e[31;99m\]\$\[\e[0m\]'
#PS1 知识:\e[F;Bm, 关闭颜色\e[0m
#echo -e "\e[34;35m kong\e[0mfei"; \e 相当于\033
#echo -e "\033[31mWarning: $FNAME/$FILE have not configure rules conf,pls check.\033[0m"
: << EOF

\$ 提示符 root # 普通用户 $
设置字符序列颜色格式为：\[\e[F;Bm\]
F为自体颜色， 编号30-37 B为背景颜色,编号：40-47
\e[0m关闭颜色输出 当B=1时将显示加亮加粗的字体

颜色表(注意不是组合后的结果):
前景   背景  颜色
30 40 黑色
31 41 红色
32 42 绿色
33 43 黄色
34 44 蓝色
35 45 紫红色
36 46 青蓝色
37 47 白色

代码 意义
0 OFF
1 高亮显示
4 underline
5 闪烁
7 反白显示
8 不可见
EOF

#SHELL=/bin/bash PS1=$'script
#Enable bash_completion
#complete
EDITOR=vim

#configure for git-aware-prompt -Begin
#export GITAWAREPROMPT=~/.bash/git-aware-prompt
#source $GITAWAREPROMPT/main.sh
#export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
#export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
#configure for git-aware-prompt -End

# git clone from github START-----------------------
#手册与bash界面
PAGER='less -X -M'
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

#bash界面
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[01;36m'
export LESS_TERMCAP_md=$'\E[01;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;33m'
#export PS1="\[\e[1;33m\][\[\e[1;35m\]\u\[\e[1;36m\]@\[\e[1;32m\]\h \[\e[1;38m\]\W\[\e[1;33m\]]\\$\[\e[0m\]"
#git clone from github END-----------------------

#Only show directory
#export PS1="\[\e[1;33m\][\[\e[1;35m\]\u\[\e[1;36m\] \[\e[1;38m\]\w\[\e[1;33m\]]\\$\[\e[0m\]"
export PS1="\[\e[1;33m\][\[\e[1;35m\]\l\[\e[1;36m\] \[\e[1;36m\]\W\[\e[1;33m\]]\\$\[\e[0m\]"
#export PS1="\[\e[1;33m\][\[\e[1;35m\]\w\[\e[1;33m\]\]]\$\[\e[0m\]"
#export PS1="\[\e[1;33m\][\[\e[1;35m\]\[\e[1;36m\]\[\e[1;38m\]\W\[\e[1;33m\]]\\$\[\e[0m\]"

get_ps1()
{
   Date=$(date +%F)
   
   Time=$(date -R | cut -c 18-25 |sed 's/,//')
   
   Lunar=$(lunar `date +%Y\ %m\ %d` |grep '^Lunar\ :' |awk '{print $3}' |sed 's/^.....\(.*\)..$/\1/')
   
   dn=$(ls -l | grep ^d | wc -l);fn=$(expr $(ls | wc -l) - ${dn})
   
   Num=$(echo $Lunar|wc -m)
   [ "$Num" = "5" ] && space=' '
   [ "$Num" = "4" ] && space='  '
   
   #PS1="\342\224\214[\[\e[01;32m\]${Date}/${Lunar} ${space}${Time}\[\e[00m\]]\n\
   #\342\224\234[\[\e[01;34m\]${dn}\[\e[00m\]+${fn}][\[\e[01;34m\]\w\[\e[00m\]]\n\
   #\342\224\224[${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h-\l \[\e[00m\]\342\225\260\137\342\225\257]\$"

   PS1="\342\224\214[\[\e[01;32m\]${Date}/${Lunar} ${space}${Time}\[\e[00m\]]\n\
   \342\224\234[\[\e[01;34m\]${dn}\[\e[00m\]+${fn}][\[\e[01;34m\]\w\[\e[00m\]]\n\
   \342\224\224[${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h-\l \[\e[00m\]\342\225\260\137\342\225\257]\$"
   }
#PROMPT_COMMAND=get_ps1
   
