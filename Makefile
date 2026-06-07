install:
	bundle install

test:
	bundle exec rspec

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

.PHONY: install test lint lint-fix