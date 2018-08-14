source ENV['GEM_SOURCE'] || "https://rubygems.org"

group :test do
  gem 'rake',                    :require => false
  gem 'rspec-puppet',            :require => false, :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem 'puppet-lint',             :require => false, :git => 'https://github.com/rodjek/puppet-lint.git'
  gem 'metadata-json-lint',      :require => false
  gem 'rspec-puppet-facts',      :require => false
  gem 'rspec',                   :require => false
  gem 'rspec-puppet-utils',      :require => false
  gem 'puppetlabs_spec_helper',  :require => false
end

if facterversion = ENV['FACTER_VERSION']
  gem 'facter', facterversion.to_s, :require => false, :groups => [:test]
else
  gem 'facter', :require => false, :groups => [:test]
end

ENV['PUPPET_VERSION'].nil? ? puppetversion = '~> 5.3.0' : puppetversion = ENV['PUPPET_VERSION'].to_s
gem 'puppet', puppetversion, :require => false, :groups => [:test]
