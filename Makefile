## Install tool dependencies
.PHONY: devel-deps
devel-deps:
	GO111MODULE=off go get github.com/Songmu/make2help/cmd/make2help

## Build environment for development
.PHONY: init
init:
	bundle install -j4
	bundle exec rails db:create
	bundle exec rails db:migrate
	bundle exec rails db:seed
