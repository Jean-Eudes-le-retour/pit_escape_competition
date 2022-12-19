#!/bin/sh

export PYTHONPATH=${WEBOTS_HOME}/lib/controller/python
export PYTHONIOENCODING=UTF-8
export WEBOTS_CONTROLLER_URL=tcp://localhost:1234/BB-8
export WEBOTS_STDOUT_REDIRECT=1
export WEBOTS_STDERR_REDIRECT=1
export DEFAULT_CONTROLLER=pit_escape.py

python3 launcher.py
