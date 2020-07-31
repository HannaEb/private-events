require 'rails_helper'

feature 'user can sign in and out' do

  context 'user not signed in' do
    scenario 'should display a login and a sign up link' do
      visit('/')
      expect(page).to have_link('Login')
      expect(page).to have_link('Sign up')
    end

    scenario 'should not display a sign out link or user information' do
      visit('/')
      expect(page).not_to have_link('Logout')
      expect(page).not_to have_content('Logged in as')
    end
  end

  context 'user signed in' do
    before { sign_up }

    scenario 'should display a sign out link and user information' do
      expect(page).to have_link('Logout')
      expect(page).to have_content('Logged in as Marley')
    end

    scenario 'should not display a login or a sign up link' do
      expect(page).not_to have_link('Login')
      expect(page).not_to have_link('Sign up')
    end
  end

end
