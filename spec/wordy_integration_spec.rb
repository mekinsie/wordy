require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  Word.clear
  Definition.clear
  it('creates a word and then goes to the home page that shows the word') do
    visit('/')
    click_on('Add a new word')
    fill_in('new_word', :with => 'Hello')
    fill_in('definition', :with => 'A greeting')
    click_on('Create!')
    expect(page).to have_content('Hello')
  end
end

describe('navigate to a word path', {:type => :feature}) do
  it('navigates to the word page with its definitions') do
    visit('/')
    click_on('Hello')
    expect(page).to have_content('Hello')
    expect(page).to have_content('A greeting')
  end
end

describe('delete a word path', {:type => :feature}) do
  it('deletes a word from the home page') do
    visit('/')
    click_on('Delete a word')
    click_on('Hello')
    expect(page).to have_content('There are currently no words to display')
  end
end