#!/bin/sh
# Usage: init_app.sh <project_name>
PROJECT="$1"
if [ -z "$PROJECT" ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi
mkdir ../htdocs/$PROJECT
cd ../htdocs/
mkdir vendor
git init .
git submodule add https://github.com/easyise/eiseIntra vendor/eiseIntra
git submodule add https://github.com/easyise/eiseXLSX vendor/eiseXLSX
git submodule add https://github.com/easyise/eiseMail vendor/eiseMail
git submodule add https://github.com/easyise/eiseREST vendor/eiseREST
git submodule init
cp -R vendor/eiseIntra/_system_template/ ./$PROJECT
ls -al
mv ./$PROJECT/common/config_template.php ./$PROJECT/common/config.php
cp vendor/eiseIntra/inc_config_template.php vendor/eiseIntra/inc_config.php