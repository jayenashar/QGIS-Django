#!/bin/bash
# Provisioning file for Vagrant
#
# Install all required system software packages
#


set -e

# Directory of the provisioning scripts
VAGRANT_ASSETS_DIR=/vagrant/vagrant_assets

# Configuration: is sourced by each script
. ${VAGRANT_ASSETS_DIR}/setup_config.sh

${VAGRANT_ASSETS_DIR}/setup_install_deps.sh
${VAGRANT_ASSETS_DIR}/setup_db.sh
${VAGRANT_ASSETS_DIR}/setup_django.sh
${VAGRANT_ASSETS_DIR}/setup_nginx.sh
${VAGRANT_ASSETS_DIR}/setup_load_initial_data.sh


# Fix permissions on upload folder
chown -R www-data.www-data ${MEDIA_ROOT}/packages

# Clean up
echo "Cleaning up ..."
apt-get autoremove -y
apt-get clean
