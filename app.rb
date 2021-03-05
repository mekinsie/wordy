require('sinatra')
require('sinatra/reloader')
require('./lib/wordy')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:home)
end
