alias dl="yt-dlp"
alias dla="yt-dlp -x"
alias msdl="npx msdl"
alias update_wez="brew upgrade --cask wezterm-nightly --no-quarantine --greedy-latest"

export HOMEBREW_NO_EMOJI=1
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export PAGER="nvim +Man!"
export GPG_TTY=$TTY


alias ls="eza"
alias ms="miniserve --random-route -p 31818"
alias mpc="mpc -p 31812"
alias qote="shuf -n 1 ~/txt/quotes.txt"
# alias vimpc="vimpc -p 31812"
# alias ncmpcpp="ncmpcpp -p 31812"
#
#For bash
#PS1='[%u@%h %W] -> ' 

#For zsh
#PS1='(%n %~) %(!.#.>) '
PS1="(%~) -> "

setopt autocd
setopt correct
setopt HIST_IGNORE_SPACE

#fix pasting youtube links on zsh for yt-dlp
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/Users/kokjin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# eval $(thefuck --alias nope)
fpath=(~/.zshfn "${fpath[@]}")
autoload -Uz nope

# echo $(powershuf -n 1 --file ~/txt/quotes.txt)
# echo $(shuf -n 1 ~/txt/quotes.txt)
