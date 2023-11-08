FROM drupal:10-apache

ENV REPOSITORY_URL https://github.com/xtrasimplicity/CD-finder.git


RUN apt update && \
    apt install -y --no-install-recommends git && \
    git clone $REPOSITORY_URL /opt/drupal/vendor/cubear/finder

RUN composer self-update --2 && \
    composer require drupal/paragraphs && \
    composer config --no-plugins allow-plugins.composer/installers true && \
    composer config --no-plugins allow-plugins.drupal/core-composer-scaffold true && \
    composer config --no-plugins allow-plugins.drupal/core-project-message true && \
    composer update --lock || exit 1
