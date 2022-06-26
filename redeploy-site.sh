#!/bin/bash

pkill -f tmux

cd mlh_portfolio_project
git fetch && git reset origin/main --hard
source python3-virtualenv/bin/activate
pip3 freeze > requirements.txt
pip install -r requirements.txt

tmux new -d 'source python3-virtualenv/bin/activate && export FLASK_APP=app/server && flask run --host=0.0.0.0'