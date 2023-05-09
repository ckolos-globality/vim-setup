#!/usr/bin/env bash
VIMDIR="$HOME/.vim"
VIMRC="$HOME/.vimrc"

INSTALLDIR=$(dirname $(python -c 'import os, sys; print(f"{os.path.realpath(sys.argv[1])}")' $0))
echo "CHECKOUTDIR = $INSTALLDIR"

pushd $HOME
pwd
test -f  "$VIMRC" && echo /bin/mv "${VIMRC}" "${VIMRC}.bak"
test -f "$VIMDIR" && echo /bin/mv "${VIMDIR}" "${VIMDIR}.bak"
echo ln -s $INSTALLDIR $VIMDIR
echo ln -s $INSTALLDIR/vimrc $VIMRC
echo curl -fLo ${VIMDIR}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
popd
