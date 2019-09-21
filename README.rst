My custom nix expressions
=========================

Install
-------
This is meant to be a nixpkgs overlay. ::

  mkdir -p ~/.config/nixpkgs/overlays
  ln -s $PWD ~/.config/nixpkgs/overlays/10mypkgs

Highlights
----------

Jupyter ML setup
~~~~~~~~~~~~~~~~
A ready-to-go environment with Jupyter and some useful machine-learning
libraries. I used it to do the exercises in CS-233 at EPFL in Spring 2019.
Much nicer than fiddling with imperative package management in my humble
opinion. ::

  nix-shell '<nixpkgs>' -A environments.jupyter-cs233 --run jupyter-notebook
