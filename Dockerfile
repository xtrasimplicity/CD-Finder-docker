FROM drupal:10-apache

RUN apt update && \
    apt install -y --no-install-recommends git

ADD bin/clone-finder-app /
RUN chmod +x /clone-finder-app && \
    /clone-finder-app && \
    composer self-update --2 && \
    composer require drupal/paragraphs && \
    composer require drush/drush && \
    composer require 'drupal/bartik:^1.0' && \
    composer config --no-plugins allow-plugins.composer/installers true && \
    composer config --no-plugins allow-plugins.drupal/core-composer-scaffold true && \
    composer config --no-plugins allow-plugins.drupal/core-project-message true && \
    composer update --lock || exit 1

ADD docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
