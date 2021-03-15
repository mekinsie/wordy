require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @word_list = Word.all
  erb(:home)
end

get('/words')do
@word_list = Word.all
erb(:words)
end

post('/words') do
  word1 = Word.new(params[:new_word], nil)
  word1.save
  def1 = Definition.new(params[:definition], word1.id, nil)
  def1.save
  @word_list = Word.all
  erb(:words)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.update_word(params[:new_word])
  @word_list = Word.all
  erb(:word)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.delete
  @word_list = Word.all
  erb(:words)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i)
  erb(:edit_word)
end

get('/words/new') do
  @words = Word.all
  erb(:new_word)
end

get('/words/:id')do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

get('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

get('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i)
  @definition = Definition.find(params[:definition_id].to_i)
  erb(:definition)
end

get('/words/:id/add_def') do
  @word = Word.find(params[:id].to_i)
  erb(:new_definition)
end

get('/words/:id/definitions/:definition_id/edit_def') do
  @word = Word.find(params[:id].to_i)
  @definition = Definition.find(params[:definition_id].to_i)
  erb(:edit_def)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:word_id].to_i)
  @word_id = (params[:word_id].to_i)
  @def_new = Definition.new(params[:new_def], @word_id, nil)
  @def_new.save
  erb(:word)
end

patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i)
  @definition = Definition.find(params[:definition_id].to_i)
  @definition.update_def(params[:new_def])
  erb(:definition)
end

delete('/words/:id/definitions/:definition_id')do
  @word = Word.find(params[:id].to_i)
  deleted_def = Definition.find(params[:definition_id].to_i)
  deleted_def.delete
  erb(:word)
end
