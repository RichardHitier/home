#.zshrc
# Lu par le shell interactif
# j'y met ce qui concerne l'interactivité

#
autoload -U compinit
compinit

autoload edit-command-line
zle -N edit-command-line

bindkey -v #vim style
bindkey -M vicmd v edit-command-line

bind 'H' run-help

#
autoload -U colors
colors

user_color="yellow"
host_color="green"
path_color="blue"

myuser="%{$fg_bold[$user_color]%}%n"
myhost="%{$fg_bold[$host_color]%}%m"
#myhost="%{$fg[$host_color]%}%n"
mypath="%{$fg_bold[$path_color]%}%~"
myend="%{$reset_color%}"
PS1="[$myuser$myend@$myhost$myend]$mypath$myend: "
#PS1="[$myhost$myend]$mypath$myend:%# "




#External Setup Files
for file in ~/.rcdir/*
do
    source $file
done
