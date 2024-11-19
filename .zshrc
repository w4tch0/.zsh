# .zshrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${HOME}/.cache/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${HOME}/.cache/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If cache directory is missing, create it.
if [[ ! -d "${HOME}/.cache" ]]; then
  mkdir "${HOME}/.cache"
fi

# Keep zsh history in user home.
export HISTFILE="${HOME}/.zsh_history"

# Variables.
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"
export PAGER="/usr/bin/less"
export BROWSER="/usr/bin/open"

# Setup brew environment:
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set zstyle options.
zstyle ':zim:zmodule' use 'degit'
zstyle ':zim:input' double-dot-expand yes
zstyle ':zim:completion' dumpfile ${HOME}/.cache/zcompdump
zstyle ':completion::complete:*' cache-path ${HOME}/.cache/zcompcache
#zstyle ':zim' disable-version-check yes

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
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Initialize zimfw modules.
source ${ZIM_HOME}/init.zsh

# Use python environment set by pyenv.
PYENV_ROOT="${HOME}/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Sourcing work functions here:
if [[ -f ${HOME}/Tools/scripts/aws_saml.sh ]] ; then . ${HOME}/Tools/scripts/aws_saml.sh ; fi
if [[ -f ${HOME}/Tools/scripts/rds_wrapper.sh ]] ; then . ${HOME}/Tools/scripts/rds_wrapper.sh ; fi
if [[ -f ${HOME}/Tools/scripts/misc.sh ]] ; then . ${HOME}/Tools/scripts/misc.sh ; fi

# Powerlevel10k theme.
# To customize prompt, run `p10k configure` or edit ${ZDOTDIR}/.p10k.zsh.
[[ ! -f ${ZDOTDIR}/.p10k.zsh ]] || source ${ZDOTDIR}/.p10k.zsh
