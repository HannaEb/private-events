require 'rails_helper'

feature 'user can sign up, log in and log out' do

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

  context 'invalid details' do
    scenario 'does not allow more than one user to sign up with the same username' do
      sign_up
      click_link('Logout')
      click_link('Sign up')
      fill_in('Username', with: 'Marley')
      fill_in('Email', with: 'marley@example.com')
      click_button('Create')
      expect(current_path).to eq(new_user_path)
    end

    scenario 'does not allow user to sign up without username and email' do
      visit('/')
      click_link('Sign up')
      click_button('Create')
      expect(current_path).to eq(new_user_path)
    end

    scenario ' does not allow user to log in without username' do
      visit('/')
      click_link('Login')
      click_button('Login')
      expect(current_path).to eq(login_path)
    end

  end


end
