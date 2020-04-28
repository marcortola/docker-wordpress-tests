ARG WORDPRESS_VERSION
ARG PHP_VERSION
FROM wordpress:${WORDPRESS_VERSION}-php${PHP_VERSION}-apache

RUN apt-get update && apt-get install -y --no-install-recommends \
		subversion \
		unzip \
		wget \
		git-all \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apt/archives

ENV WP_TESTS_DIR=/tmp/wordpress-tests-lib
ENV WP_CORE_DIR=/var/www/html

COPY install-wp-tests.sh /usr/local/bin/install-wp-tests
RUN chmod +x /usr/local/bin/install-wp-tests \
	&& install-wp-tests database root '' database ${WORDPRESS_VERSION}

COPY init-wp.sh /usr/local/bin/
ENTRYPOINT ["init-wp.sh"]
