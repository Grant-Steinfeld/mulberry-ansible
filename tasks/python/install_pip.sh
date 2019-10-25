#!/bin/bash
export HOMEDIR=/opt/bchlabs/apps
curl https://bootstrap.pypa.io/get-pip.py | $HOMEDIR/python2/py278/bin/python2.7 -

logger install_python_virtual_env
$HOMEDIR/python2/py278/bin/pip install virtualenv
