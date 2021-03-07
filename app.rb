require('sinatra')
require('sinatra/reloader')
require('./lib/wordy')
require('./lib/definition')
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
  word1 = Word.new(params[:new_word], nil)
  word1.save
  def1 = Definition.new(params[:definition], word1.id, nil)
  def1.save
  @word_list = Word.all
  erb(:home)
end  

get('/edit_word') do
  @words = Word.all
  erb(:edit_word)
end

patch('/') do
  @word_list = Word.all
  word = Word.find(params[:edited_word_id].to_i)
  word.update_word(params[:new_word])
  erb(:home)
end

get('/delete_word') do 
  @words = Word.all
  erb(:delete_word)
end

delete('/') do
  @word = Word.find(params[:deleted_word_id].to_i)
  @word.delete
  @word_list = Word.all
  erb(:home)
end

get('/add_def/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:new_definition)
end  

post('/:id') do
  @word = Word.find(params[:word_id].to_i)
  @word_id = (params[:word_id].to_i)
  @def_new = Definition.new(params[:new_def], @word_id, nil)
  @def_new.save
  erb(:word)
end  

get('/edit_def/:id') do 
  @word = Word.find(params[:id].to_i)
  erb(:edit_def)  
end

patch('/:id') do
  @word = Word.find(params[:id].to_i)
  @def = Definition.find(params[:edited_def_id].to_i)
  @def.update_def(params[:new_def])
  erb(:word)
end

get('/delete_def/:id') do 
  @word = Word.find(params[:id].to_i)
  erb(:delete_def)
end 

delete('/:id')do
@word = Word.find(params[:id].to_i)
deleted_def = Definition.find(params[:deleted_def].to_i)
deleted_def.delete
erb(:word)
end  

get('/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end  