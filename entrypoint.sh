#!/bin/sh -x
VENVDIR=/v
DATADIR=/data
JUPYDIR=/root/.jupyter

JUPYDEF=/.default.py
JUPYCNF=$JUPYDIR/jupyter_lab_config.py

cd $DATADIR
. $VENVDIR/bin/activate

[ ! -f $JUPYCNF ] && cp $JUPYDEF $JUPYCNF

( $@ )
