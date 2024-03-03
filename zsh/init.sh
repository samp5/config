if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git

  colored-man-pages

	zsh-autosuggestions

	zsh-syntax-highlighting

	web-search

  zsh-history-substring-search
  
  zsh-autocomplete

  fd
)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

function mkcd {
		mkdir $1 && cd $_
}

bindkey '' autosuggest-accept

export windir="/mnt/c/Users/sampr/UIC/OneDrive - University of Illinois Chicago/school/cs141_bad/wsl"

source ~/.config/op/plugins.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"
