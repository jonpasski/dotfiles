
# bug https://bugs.launchpad.net/ubuntu/+source/xfce4-terminal/+bug/778801
# setting TERM based on COLORTERM
case $COLORTERM in
Terminal) export TERM=xterm-color ;;         # this is XFCE Terminal
gnome-terminal) export TERM=xterm-color ;;   # this is gnome-terminal
wterm-xpm) export TERM=xterm ;;              # this is wterm
Eterm) export TERM=Eterm ;;                  # this is Eterm
1) export TERM=xterm-color ;;                # this is lxterminal, konsole,
                                             # yakuake, uxterm, Mac OSX 
                                             #  terminal, putty ...
# rxvt) ;;                                   # xterm, aterm, rxvt-unicode
esac

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
    screen) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

PROMPT_DIRTRIM=4

if [ "$color_prompt" = yes ]; then
    PS1="${C_GREEN}\u@\h${C_RESET}:${C_CYAN}\w${C_RESET}\n\$ "
else
    PS1='$\u@\h:\w\n\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

