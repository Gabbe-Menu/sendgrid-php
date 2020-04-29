.PHONY: clean install ci-install test test-integ test-docker bundle

clean:
	@rm -rf vendor composer.lock sendgrid-php.zip

install: clean
	composer install

ci-install: clean
	composer install --no-dev

test:
	vendor/bin/phpunit test/unit --filter test*

test-integ: test
	vendor/bin/phpunit test --filter test*

test-docker:
	curl -s https://raw.githubusercontent.com/sendgrid/sendgrid-oai/master/prism/prism.sh | bash

bundle: ci-install
	zip -r sendgrid-php.zip . -x \*.git\* \*composer.json\* \*scripts\* \*test\* \*.travis.yml\* \*prism\*
