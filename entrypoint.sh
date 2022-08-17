#!/bin/sh -x
VENVDIR=/v
DATADIR=/data
JUPYDIR=/root/.jupyter

JUPYDEF=/.default.py
JUPYCNF=$JUPYDIR/jupyter_lab_config.py
JUREQFL=$DATADIR/requirements

cd $DATADIR
. $VENVDIR/bin/activate

[ ! -f $JUPYCNF ] && cp $JUPYDEF $JUPYCNF
[ -f $JUREQFL ] && pip install -Ur $JUREQFL

jupyter lab build

( $@ )
