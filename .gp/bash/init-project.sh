#!/bin/bash
#
# init-project.sh
# Description:
# Project specific initialization.

# Load logger
. .gp/bash/workspace-init-logger.sh

# Install Composer Dependencies
composer install

# Create Concrete database
mysql -u root -e "drop database if exists concretecms; create database concretecms"

echo "Installing Concrete CMS with canonical URL $GITPOD_WORKSPACE_URL"

# Install Concrete
concrete/bin/concrete c5:install --db-server=localhost --db-username=root \
  --db-database=c5 --admin-email=demo@concretecms.com --admin-password=password \
  --canonical-url=$GITPOD_WORKSPACE_URL