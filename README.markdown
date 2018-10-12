# To utilize

~~~
docker run -v `pwd`:/code cyberious/rspec_puppet:5.5
~~~

To create a rake task to do this for you can include the following in your Rakefile, this does require the gem `docker-api`

~~~
desc 'Run rspec tests inside of a docker container'
task 'docker:spec' do
  require 'docker'
  current_project = File.dirname(__FILE__)
  container = Docker::Container.create('Image' => '0cc370e7f36d', 'HostConfig' => {'Binds' => ["#{current_project}:/code:ro"]})
  container.tap(&:start).attach { |stream, chunk| puts "#{chunk}" unless chunk == '.'}
end
~~~
