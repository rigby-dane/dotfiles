# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
    archlinux
    git
    python
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
)
export ZSH=$HOME/.oh-my-zsh
export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0
export LIBGL_ALWAYS_INDIRECT=1

ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. /usr/share/LS_COLORS/dircolors.sh

bindkey -v
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

PATH="/home/rigby/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/rigby/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/rigby/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/rigby/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/rigby/perl5"; export PERL_MM_OPT;

export BROWSER='/mnt/c/Windows/explorer.exe'
alias see='explorer.exe'
