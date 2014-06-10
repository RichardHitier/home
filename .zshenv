#~/.zshenv
# toujours lu (juste après /etc/zshenv)

#j'y met ce qui concerne l'environnement

# 
export HISTFILE="$HOME/.zhistory"
export SAVEHIST="5000" #taille du fichier
export HISTSIZE="5000" #taille historique courant

export MAILPATH="/home/richard/Mail/*?Msg dans $_:/var/spool/mail/richard?un message dans la Mbox"
#export MAILPATH="/var/spool/mail/hitier?Un message dans ta Mbox"
export MAILCHECK=60

setopt HIST_IGNORE_ALL_DUPS 
#setopt INC_APPEND_HISTORY #ces deux la se telescopent : oui
setopt SHARE_HISTORY

# 
setopt INTERACTIVE_COMMENTS
#setopt MAIL_WARNING
setopt nobeep
#setopt cdablevars
#setopt autocd
