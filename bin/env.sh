#!/bin/bash -e

BASEDIR=`dirname $0`/..

if [ ! -d "$BASEDIR/env" ]; then
    virtualenv -q $BASEDIR/env --prompt='(dcos-myriad) '
    echo "Virtualenv created."

    source $BASEDIR/env/bin/activate
    echo "Virtualenv activated."

    pip install -r $BASEDIR/requirements.txt
    pip install -e $BASEDIR
    echo "Requirements installed."
elif [ ! -f "$BASEDIR/env/bin/activate" -o "$BASEDIR/setup.py" -nt "$BASEDIR/env/bin/activate" ]; then
    source $BASEDIR/env/bin/activate
    echo "Virtualenv activated."

    pip install -r $BASEDIR/requirements.txt
    pip install -e $BASEDIR
    echo "Requirements installed."
fi
