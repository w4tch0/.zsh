# ~/.zsh

My zsh shell setup for MacOS using [zim:fw](https://github.com/zimfw/zimfw) framework and [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme.

Installation path: `$ZDOTDIR=${HOME}/.zsh/`

History file path: `$HISTFILE=${HOME}/.zsh_history`

## Prerequisites

### Xcode Command Line Tools:
`
xcode-select –install
`

### Homebrew:
`
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
`
### fzf, fd, bat, pyenv:
`
brew install fzf fd bat pyenv
`


## Installation

### 1. Clone the repository into ~/.zsh:
`
git clone https://github.com/w4tch0/.zsh.git ~/.zsh/
`

### 2. Create symbolic link to .zshenv:
`
ln -s ~/.zsh/.zshenv ~/.zshenv
`

### 3. Restart the terminal.
