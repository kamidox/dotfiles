% MISC(shell) Um Pages | Um Pages
%
% August 21, 2018
# NAME
misc -- Misc commands for shell

# DESCRIPTION

## Convert GB2312 to UTF8

find *.txt -exec sh -c "iconv -f GB18030 -t UTF8 {} > {}.txt" \;

## Download whole website

wget -r -p -k -np http://lightgbm.readthedocs.io/en/latest/index.html

Replace the URL part you want to download.

## Upgrade all installed python package

pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install --upgrade

## Jupter Notebook config file

~/.ipython/profile_default/ipython_config.py

