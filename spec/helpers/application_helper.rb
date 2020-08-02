module ApplicationHelper

  def sign_up_user_one
    visit('/')
    click_link('Sign up')
    fill_in('Username', with: 'Marley')
    fill_in('Email', with: 'marley@example.com')
    click_button('Create')
  end

  def sign_up_user_two
    visit('/')
    click_link('Sign up')
    fill_in('Username', with: 'Luni')
    fill_in('Email', with: 'luni@example.com')
    click_button('Create')
  end

  def create_event_one
    click_button('Create Event')
    fill_in('Title', with: 'Marley\'s Event')
    fill_in('Description', with: 'Plans for the day')
    fill_in('Location', with: 'Park')
    fill_in('Date', with: '2020-09-05')
    fill_in('Start-time', with: '2020-09-05 15:00:00 UTC')
    fill_in('Finish-time', with: '2020-09-05 18:00:00 UTC')
    click_button('Create')
  end

  def create_event_two
    click_button('Create Event')
    fill_in('Title', with: 'Luni\'s Event')
    fill_in('Description', with: 'Games all day')
    fill_in('Location', with: 'Garden')
    fill_in('Date', with: '2020-08-06')
    fill_in('Start-time', with: '2020-08-06 13:00:00 UTC')
    fill_in('Finish-time', with: '2020-08-08 17:00:00 UTC')
    click_button('Create')
  end



end
