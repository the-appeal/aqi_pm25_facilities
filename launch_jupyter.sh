#!/usr/bin/bash
# Ensure dependencies are installed, then launch Jupyter notebook with appropriate env variables
poetry install
poetry run python .pythonrc
poetry run jupyter notebook $1
exit
