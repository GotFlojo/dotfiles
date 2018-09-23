#!/bin/bash

# Find editor
if [[ -n "$(command -v nvim)" ]]; then
    GITEDITOR="$(command -v nvim)"
    EDITORLINE="editor = $GITEDITOR"
    # DIFFCOMMAND="nvim -d $1 $2"
elif [[ -n "$(command -v vim)" ]]; then
    GITEDITOR="$(command -v vim)"
    EDITORLINE="editor = $GITEDITOR"
    # DIFFCOMMAND="vimdiff $1 $2"
elif [[ -n "$(command -v vi)" ]]; then
    GITEDITOR="$(command -v vi)"
    EDITORLINE="editor = $GITEDITOR"
fi

# cat <<EOF > "$HOME/.gitconfig"
cat <<EOF > "./test-gitconfig"
# This gitconfig was generated via ~/.dotfiles/generate_gitconfig.sh
# Edit that file, not this one!

[user]
	name = Florian Fischer
	email = gotflojo@users.noreply.github.com
[core]
    $EDITORLINE
    excludesfile = $HOME/.gitignore_global
[rerere]
    enabled = true
[alias]
    co = checkout
    ci = commit
    st = status
    br = branch
    hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
    type = cat-file -t
    dump = cat-file -p
EOF

if [[ "$(uname)" == Darwin ]]; then
  CREDENTIAL_HELPER="osxkeychain"
elif [[ -n "$(command -v gnome-keyring-daemon)" ]]; then
  CREDENTIAL_HELPER="/usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring"
fi

if [[ -n "$CREDENTIAL_HELPER" ]]; then
  cat <<EOF >> "$HOME/.gitconfig"
[credential]
  helper = $CREDENTIAL_HELPER
EOF
fi


