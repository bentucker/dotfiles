zimfw() { source /home/magma/.zim/zimfw.zsh "${@}" }
fpath=(/home/magma/dotfiles/zim/modules/git/functions /home/magma/dotfiles/zim/modules/utility/functions /home/magma/dotfiles/zim/modules/git-info/functions ${fpath})
autoload -Uz git-alias-lookup git-branch-current git-branch-delete-interactive git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw coalesce git-action git-info
source /home/magma/dotfiles/zim/modules/environment/init.zsh
source /home/magma/dotfiles/zim/modules/git/init.zsh
source /home/magma/dotfiles/zim/modules/input/init.zsh
source /home/magma/dotfiles/zim/modules/termtitle/init.zsh
source /home/magma/dotfiles/zim/modules/utility/init.zsh
source /home/magma/dotfiles/zim/modules/powerlevel10k/powerlevel10k.zsh-theme
source /home/magma/dotfiles/zim/modules/zsh-completions/zsh-completions.plugin.zsh
source /home/magma/dotfiles/zim/modules/completion/init.zsh
source /home/magma/dotfiles/zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/magma/dotfiles/zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/magma/dotfiles/zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
