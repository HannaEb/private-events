module ApplicationHelper

  def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Username', with: 'Marley')
    fill_in('Email', with: 'marley@example.com')
    click_button('Create')
  end

end
