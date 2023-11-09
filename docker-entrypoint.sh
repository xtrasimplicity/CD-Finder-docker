#!/bin/bash
set -e

if [[ "${AUTO_UPDATE_APP_ON_STARTUP}" == "yes" ]]; then
  echo "Updating Finder app..."
  /clone-finder-app
fi

if [[ ! -d /opt/drupal/web/modules/contrib/cubear ]]; then
  echo "Linking Finder module to /opt/drupal/web/modules/contrib..."
  ln -s /opt/drupal/vendor/cubear /opt/drupal/web/modules/contrib/
fi

exec docker-php-entrypoint "$@"
