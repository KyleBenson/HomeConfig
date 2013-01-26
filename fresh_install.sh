#! /bin/bash

# Install all the dependencies for ns-3, as well as a bunch of other random stuff
sudo apt-get install gcc g++ python python-dev mercurial bzr gdb valgrind gsl-bin libgsl0-dev libgsl0ldbl flex bison libfl-dev tcpdump sqlite sqlite3 libsqlite3-dev libxml2 libxml2-dev libgtk2.0-0 libgtk2.0-dev vtun lxc uncrustify doxygen graphviz imagemagick python-sphinx dia python-pygraphviz python-kiwi python-pygoocanvas libgoocanvas-dev libboost-signals-dev libboost-filesystem-dev

# Python stuff
sudo apt-get install python-scipy ipython python-matplotlib

# LaTeX stuff
# okular works well for viewing PDFs through kile
sudo apt-get install texlive texlive-extra-utils texlive-latex-extra kile texlive-publishers texstudio okular

# Random utils I like
sudo apt-get install emacs git konsole gimp
