#!/bin/sh -x
PROJECT="$1"
mkdir ../htdocs/$PROJECT
cd ../htdocs/$PROJECT/
mkdir vendor
git init .
git submodule add https://github.com/easyise/eiseIntra vendor/eiseIntra
git submodule add https://github.com/easyise/eiseXLSX vendor/eiseXLSX
git submodule add https://github.com/easyise/eiseMail vendor/eiseMail
git submodule add https://github.com/easyise/eiseREST vendor/eiseREST
git submodule init
cp -R vendor/eiseIntra/_system_template/ ./
ls -al
mv common/config_template.php common/config.php
cp vendor/eiseIntra/inc_config_template.php vendor/eiseIntra/inc_config.php