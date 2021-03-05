require('sinatra')
require('sinatra/reloader')
require('./lib/wordy')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @word_list = Word.all
  erb(:home)
end

get('/new') do
  erb(:new_word_form)
end

post('/') do
  word1 = Word.new(params(:new_word), params(:definition), nil)
  word1.save
  @word_list = Word.all
  erb(:home)
end