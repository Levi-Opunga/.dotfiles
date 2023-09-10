# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Antigen
source $HOME/antigen.zsh
    
# Load the oh-my-zsh's library
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

# NOTE:: DOTENV SETUP
ZSH_DOTENV_FILE=.dotenv
ZSH_DOTENV_PROMPT=false
# in ~/.zshrc, before Oh My Zsh is sourced:
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup. zsh-interactive-cd 
plugins=(git npm dotenv web-search ubuntu sdk rust nvm mvn colorize emoji-clock copyfile copypath aliases alias-finder yarn charm zsh-syntax-highlighting zsh-autosuggestions)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# neofetch

export PATH=$PATH:/usr/local/go/bin

export PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"

export MANPATH="/usr/local/texlive/2022/texmf-dist/doc/man:$MANPATH"

export MANPATH="/opt/infrastructure/clojure/bin /opt/infrastructure/clojure/man:$MANPATH"

export INFOPATH="/usr/local/texlive/2022/texmf-dist/doc/info:$INFOPATH"


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias sail="./vendor/bin/sail"
alias lvim="/home/login/.local/bin/lvim"

alias deemix="~/Documents/Executables/deemix-gui.AppImage"
alias deezloader="~/Documents/Executables/deemix-gui.AppImage"


#python3 ~/ascii.py|lolcat-c	

alias exitt="sl -a -l
exit"

alias trainride="clear
for (( ; ; 	))
do
 sl -f -a|pv -L 10000 -q|lolcat-c

done"

vt=/home/login/Pictures/ascii/vt100

alias cmatrix="cmatrix|pv -L 200000"
alias cmatrixc="cmatrix|pv -L 200000 -q|lolcat-c"

alias globeSpin="clear
for (( ; ; ))
do
pv $vt/movglobe.vt -L 20000 -q|lolcat-c

done"

alias globe="clear
for (( ; ; 	))
do
pv $vt/globe.vt -L 20000 -q|lolcat-c

done"

alias postman="/home/login/Documents/Postman/Postman"

alias zshrc="${=EDITOR} ~/.zshrc"

alias nvimrc="cd ~/.config/nvim/;
nvim ."

alias pn=pnpm 


alias pojo="/home/login/Documents/devDocs/jsonschema2pojo-1.1.1/bin/jsonschema2pojo"

alias doughnut=/home/login/Pictures/ascii/doughnut/donut_deobfuscated

alias neoColor="~/colorfetch.sh"

alias ants="/home/login/Pictures/ascii/tunel.sh"

alias antColor="/home/login/Pictures/ascii/tunel.sh|lolcat-c"
alias bar="~/.config/polybar/launch.sh --material" 

PATH="/home/login/perl5/bin${PATH:+:${PATH}}"; export PATH;

PERL5LIB="/home/login/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/login/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/login/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/login/perl5"; export PERL_MM_OPT;


alias portacle="/home/login/Documents/portacle/portacle.run"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


source <(ng completion script)

export PATH="$PATH:/home/login/Android/Sdk/tools"





# Load Angular CLI autocompletion.
source <(ng completion script)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/login/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/login/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/login/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/login/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias java-format="/home/login/Documents/nvimStuff/google-java-format-master/core/target/google-java-format-HEAD-SNAPSHOT-all-deps.jar"

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

[ -f "/home/login/.ghcup/env" ] && source "/home/login/.ghcup/env" # ghcup-env


# Example install plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# Example theme
plug "zap-zsh/zap-prompt"

# Example install completion
plug "esc/conda-zsh-completion"


CATALINA_HOME="/home/login/Documents/Amigos Complete/apache-tomcat-9.0.70"

export RSecretkey="9b3e4b96a21f70016649e2bc85ad92b7"
export RPublickey="3b4a9f71ddcd9a7a3b2d61fcb151b211"


 alias cue='~/go/bin/cue'
 alias nap='~/go/bin/nap'
alias gopls='~/go/bin/gopls'
alias typer='~/go/bin/typer'
alias catf='batcat'
alias notes='~/go/bin/noted'
alias draw="~/go/bin/draw"
alias confetty="~/go/bin/confetty"
alias gambit="~/go/bin/gambit"

alias ugm='~/go/bin/ugm'
alias focus='~/Documents/focus/focus'
#eval "$(oh-my-posh init zsh)"


#"/home/login/.jbang/bin:/home/login/.local/bin:/home/login/.opam/default/bin:/home/login/perl5/bin:/home/login/.jbang/bin:/home/login/.local/bin:/home/login/.opam/default/bin:/home/login/perl5/bin:/home/login/.jbang/bin:/home/login/.local/bin:/home/login/.cabal/bin:/home/login/.ghcup/bin:/home/login/.opam/default/bin:/home/login/anaconda3/bin:/home/login/anaconda3/condabin:/home/login/.sdkman/candidates/springboot/current/bin:/home/login/.sdkman/candidates/kotlin/current/bin:/home/login/.sdkman/candidates/java/current/bin:/home/login/.nvm/versions/node/v18.13.0/bin:/home/login/perl5/bin:/home/login/.cargo/bin:/home/login/.local/bin:/opt/maven/bin:/home/login/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/ssl/bin:/snap/bin:/home/login/.dotnet/tools:/usr/local/go/bin:/home/login/.local/share/JetBrains/Toolbox/scripts:/usr/local/go/bin:/usr/local/go/bin:/usr/local/go/bin"


export  PATH="/home/login/.jbang/bin /home/login/.local/bin /home/login/.opam/default/bin /home/login/perl5/bin /home/login/.jbang/bin /home/login/.local/bin /home/login/.opam/default/bin /home/login/perl5/bin /home/login/.jbang/bin /home/login/.local/bin /home/login/.cabal/bin /home/login/.ghcup/bin /home/login/.opam/default/bin /home/login/anaconda3/bin /home/login/anaconda3/condabin /home/login/.sdkman/candidates/springboot/current/bin /home/login/.sdkman/candidates/kotlin/current/bin /home/login/.sdkman/candidates/java/current/bin /home/login/.nvm/versions/node/v18.13.0/bin /home/login/perl5/bin /home/login/.cargo/bin /home/login/.local/bin /opt/maven/bin /home/login/.nix-profile/bin /nix/var/nix/profiles/default/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/games /usr/local/games /snap/bin /usr/local/ssl/bin /snap/bin /home/login/.dotnet/tools /usr/local/go/bin /home/login/.local/share/JetBrains/Toolbox/scripts /usr/local/go/bin /usr/local/go/bin /usr/local/go/bin:$PATH:/home/login/.sdkman/candidates/kotlin/current/bin/kotlinc-jvm"


# study stream aliases
# Requires https://github.com/caarlos0/timer to be installed. spd-say should ship with your distro

declare -A pomo_options
pomo_options["Work"]="61"
pomo_options["Break"]="15"

pomodoro () {
  clear
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val Session |lolcat
  start=`date +%H:%M` 
  echo Started At $start | lolcat
  timer-own ${pomo_options["$val"]}m
  notify-send -t 3000 -i face-smile "Timer Notification" "$1 session <b>Complete</b>"
  play  "~/Music/notificationsounds/success-1-6297.mp3" &>/dev/null |lolcat 
  endat=`date +%H:%M`
  echo Ended at $endat |lolcat
  fi
}

alias wo="pomodoro 'Work'"
alias br="pomodoro 'Break'"

usegradleV(){
 gradle wrapper --gradle-version $1 --distribution-type all
}

getPid(){
  ps aux | grep $1
}

onPort(){
sudo lsof -i -P -n | grep :$1 
}

killPort(){
   kill -9 $(lsof -t -i:$1)   
}

loudTimer(){
  clear
  echo Timer Started |lolcat 
  timer-own $1
    notify-send -t 3000 -i face-smile "Timer Notification" "<b>Done</b>"
  play  "~/Music/notificationsounds/success-1-6297.mp3" &>/dev/null 2>&1 
  echo Timer Duration Complete |lolcat
}
silentTimer(){
  clear
  echo Timer Started |lolcat 
    timer-own $1
    notify-send -t 3000 -i face-smile "Timer Notification" "<b>Done</b>"
  echo Timer Duration Complete |lolcat
}

alias loudtimer="loudTimer"
alias silenttimer="silentTimer"

tere() {
    local result=$(command tere "$@")
    [ -n "$result" ] && cd -- "$result"
}

append(){
  echo $1 >> $2
} 

alias n.='nvim .'

alias theme-directory=~/.config/polybar/launch.sh 

polybar-theme() {
theme-directory  $1  &>/dev/null 
}

alias i3rc='nvim ~/.config/i3/config' 

alias n=nvim 

alias ils='timg --grid=2x1 --upscale=i --center --title --frames=1 '

alias icat="kitty +kitten icat"

alias clip="kitty +kitten clipboard --get-clipboard"

alias cls=clear
own(){ 
nohup $1 & 
}

alias ls="logo-ls" 
myeditor(){
  java -jar /home/login/TextEditor/build/libs/TextEditor-2.0-SNAPSHOT.jar "`realpath $1`"  
}
 
# [[ ! -r /home/login/.opam/opam-init/init.zsh ]] || source /home/login/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null



# opam configuration 
 [[ ! -r /home/login/.opam/opam-init/init.zsh ]] || source /home/login/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


export OB_HOME=~/Documents/Obsidian/Productivity/Productivity/
 
export PATH="$HOME/.nvm/versions/node/v16.18.1/bin/tsserver:$HOME/.nvm/versions/node/v16.18.1/bin/svelteserver:$PATH"

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# pnpm
export PNPM_HOME="/home/login/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
###-begin-ionic-completion-###

if type compdef &>/dev/null; then
  __ionic() {
    compadd -- $(ionic completion -- "${words[@]}" 2>/dev/null)
  }

  compdef __ionic ionic
fi

###-end-ionic-completion-###

eval $(opam env)
AUTOENV_PRESERVE_CD='yes'
AUTOENV_ENV_FILENAME='.env.auto'
AUTOENV_ENV_LEAVE_FILENAME='.env.leave'
AUTOENV_VIEWER='less'
AUTOENV_ENABLE_LEAVE='yes'
AUTOENV_ASSUME_YES='yes'
alias envinit=autoenv_init
source '/home/login/.nvm/versions/node/v18.13.0/lib/node_modules/@hyperupcall/autoenv/activate.sh'
alias cde=autoenv_cd

# bun completions
[ -s "/home/login/.bun/_bun" ] && source "/home/login/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
