require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('create a tamagotchi', {:type => :feature}) do
  it ('creates a tamagotchi') do
    visit('/')
    fill_in('name', :with => 'lil tamy')
    save_and_open_page
    click_on('Birth my Tamagotchi!')
    expect(page).to have_content('lil tamy')
    expect(page).to have_content('Food level')
  end
end