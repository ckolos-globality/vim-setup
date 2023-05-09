#!/usr/bin/env bash
VIMDIR="$HOME/.vim"
VIMRC="$HOME/.vimrc"

INSTALLDIR=$(dirname $(python -c 'import os, sys; print(f"{os.path.realpath(sys.argv[1])}")' $0))
pushd $HOME
test -f  "$VIMRC" && echo /bin/mv "${VIMRC}" "${VIMRC}.bak"
test -f "$VIMDIR" && echo /bin/mv "${VIMDIR}" "${VIMDIR}.bak"
ln -s $INSTALLDIR $VIMDIR
ln -s $INSTALLDIR/vimrc $VIMRC
popd
