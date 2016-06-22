cd /code
rm Gemfile.lock
bundle install --without system_tests
bundle exec rake spec
