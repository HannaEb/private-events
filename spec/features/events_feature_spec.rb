require 'rails_helper'

feature 'events' do

  context 'no events have been added' do
    scenario 'displays empty tables and titles' do
      visit('/')
      expect(page).to have_content('Upcoming Events')
      expect(page).to have_content('Past Events')
      expect(page).to have_content('Date')
      expect(page).to have_content('Event')
      expect(page).to have_content('Location')
    end
  end

  context 'creating events' do
    scenario 'allows logged in user to create new events via their profile page' do
      sign_up_user_one
      click_link('Marley')
      create_event_one
      expect(page).to have_content('Marley\'s Event')
    end
  end

  context 'viewing events' do
    before do
      sign_up_user_one
      click_link('Marley')
      create_event_one
      click_link('Logout')
      sign_up_user_two
      click_link('Luni')
      create_event_two
      click_link('Logout')
    end

    scenario 'displays all events on homepage' do
      visit('/')
      expect(page).to have_content('Marley\'s Event')
      expect(page).to have_content('Luni\'s Event')
    end

    scenario 'allows logged in use to see events they have created' do
      visit('/')
      click_link('Login')
      fill_in('Username', with: 'Luni')
      click_button('Login')
      click_link('Luni')
      expect(page).to have_content('Luni\'s Event')
    end

    scenario 'allows user to view details of the event' do
      visit('/')
      click_link('Marley\'s Event')
      expect(page).to have_content('Plans for the day')
      expect(page).to have_content('Park')
      expect(page).to have_content('Host')
    end
  end

end
