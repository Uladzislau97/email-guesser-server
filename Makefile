install:
	bundle

start:
	ruby app.rb

test:
	bundle exec rspec spec/
