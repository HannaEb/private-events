require 'rails_helper'

feature 'attendances' do

  before do
    sign_up_user_one
    click_link('Marley')
    create_event_one
    click_link('Logout')
  end

  context 'attending events' do
    scenario 'allows logged in user to attend an event' do
      sign_up_user_two
      visit('/')
      click_link('Marley\'s Event')
      click_button('Attend')
      expect(page).to have_content('My Events')
      expect(page).to have_content('Marley\'s Event')
    end

    scenario 'does not allow logged out user to attend an event' do
      visit('/')
      click_link('Marley\'s Event')
      expect(page).not_to have_link('Attend')
    end
  end

  context 'viewing attendances' do
    scenario 'displays attendances on event page' do
      sign_up_user_two
      visit('/')
      click_link('Marley\'s Event')
      click_button('Attend')
      click_link('Events')
      click_link('Marley\'s Event')
      expect(page).to have_content('Guest List')
      expect(page).to have_content('Luni')
    end
  end

end
