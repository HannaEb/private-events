require 'rails_helper'

describe User, type: :model do

  it 'is not valid unless it has a unique name' do
    User.create(name: 'Marley', email: 'marley@example.com')
    user = User.new(name: 'Marley', email: 'marley@example.com')
    expect(user).not_to be_valid
  end

  it 'is not valid without a username' do
    user = User.new(email: 'marley@example.com')
    expect(user).not_to be_valid
  end

  it 'is not valid without an email address' do
    user = User.new(name: 'Marley')
    expect(user).not_to be_valid
  end 

end
