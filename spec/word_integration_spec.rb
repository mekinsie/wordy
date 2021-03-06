require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  Word.clear
  Definition.clear
  it('creates a word and then goes to the home page that shows the word') do
    visit('/')
    click_on('Words')
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
    click_on('Words')
    click_on('Hello')
    expect(page).to have_content('Hello')
    expect(page).to have_content('A greeting')
  end
end

describe('delete a word path', {:type => :feature}) do
  it('deletes a word from the home page') do
    visit('/words')
    click_on('Hello')
    click_on('Delete word')
    expect(page).to have_content('There are currently no words to display')
  end
end

describe('edit a word path', {:type => :feature}) do
  it('edits a word') do
    visit('/words')
    click_on('Add a new word')
    fill_in('new_word', :with => 'Hello')
    fill_in('definition', :with => 'A greeting')
    click_on('Create!')
    click_on('Hello')
    click_on("Edit word")
    fill_in("new_word", :with => "Hola")
    click_on('Update!')
    expect(page).to have_content('Hola')
  end
end

describe('add a definition path', {:type => :feature}) do
  it('adds a definition to an existing word') do
    visit('/words/2')
    click_on('Add a definition')
    fill_in('new_def', :with => "Hello in Spanish")
    click_on("Create!")
    expect(page).to have_content('A greeting')
    expect(page).to have_content('Hello in Spanish')
  end
end

describe('edit a definition path', {:type => :feature}) do
  it('edits an existing definition') do
    visit('/words/2')
    click_on('A greeting')
    click_on('Edit definition')
    fill_in('new_def', :with => "A better greeting than Hello")
    click_on("Update!")
    expect(page).to have_content('A better greeting than Hello')
  end
end

describe('delete a definition path', {:type => :feature}) do
  it('deletes an existing definition') do
    visit('/words/2')
    click_on("Hello in Spanish")
    click_on('Delete definition')
    expect(page).not_to have_content('Hello in Spanish')
    expect(page).to have_content('A better greeting than Hello')
  end
end
