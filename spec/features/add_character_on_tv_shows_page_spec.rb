require 'rails_helper'

feature "user views a TV show's details", %Q{
  * I can access a form to add a character on a TV show's page
  * I must specify the character's name and the actor's name
  * I can optionally provide a description
  * If I do not provide the required information, I receive an error message
  * If the character already exists in the database, I receive an error message
} do


  scenario "user inputs valid information for new character" do

    visit '/television_shows/new'

    fill_in('name', with: 'Joe Bob')
    fill_in('actor', with: 'Billy Bob')
    fill_in('description', with: 'A test description')

    click_on('Save')

    expect(page).to have_content "Character successfully added"

    expect(page).to have_content "Name: Joe Bob"

  end
end
