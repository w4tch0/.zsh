# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${HOME}/.cache/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${HOME}/.cache/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If cache directory structure is missing, create it.
if [[ ! -d "${HOME}/.cache/zsh" ]]; then
  mkdir -p "${HOME}/.cache/zsh"
fi

# Variables.
export HISTFILE="${HOME}/.cache/zsh/zsh_history"
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"
export PAGER="/usr/bin/less"
export BROWSER="/usr/bin/open"

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Setup FZF completion and keybindings.
export PATH="/usr/local/opt/fzf/bin:$PATH"
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# Set zstyle options
zstyle ':zim:zmodule' use 'degit'
#zstyle ':zim:input' double-dot-expand yes
zstyle ':zim:completion' dumpfile ${HOME}/.cache/zsh/zcompdump
zstyle ':completion::complete:*' cache-path ${HOME}/.cache/zsh/zcompcache
#zstyle ':zim' disable-version-check yes

# Initialize zimfw modules.
source ${ZIM_HOME}/init.zsh

# Agora function.
alg () {
ssh -p $1 localhost
}

# Use python environment set by pyenv.
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Powerlevel10k theme.
# To customize prompt, run `p10k configure` or edit ${ZDOTDIR}/.p10k.zsh.
[[ ! -f ${ZDOTDIR}/.p10k.zsh ]] || source ${ZDOTDIR}/.p10k.zsh
