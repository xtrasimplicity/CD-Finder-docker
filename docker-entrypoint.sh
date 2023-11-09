#!/bin/bash
set -e

if [[ ! -d /opt/drupal/web/modules/contrib/cubear ]]; then
  echo "Linking Finder module to /opt/drupal/web/modules/contrib..."
  ln -s /opt/drupal/vendor/cubear /opt/drupal/web/modules/contrib/
fi

exec docker-php-entrypoint "$@"
