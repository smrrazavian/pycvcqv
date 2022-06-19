#!/bin/bash
find . -name 'pylint-log.txt' -delete
find . -name 'pylint.svg' -delete
poetry run pylint pycvcqv | tee .logs/pylint-log.txt
export lintscore=$(grep 'rated at' .logs/pylint-log.txt | cut -d\  -f7 | cut -d \/ -f 1)
echo "lintscore:" $lintscore
poetry run python3 -m anybadge -o --value=${lintscore} --file=assets/images/pylint.svg pylint
