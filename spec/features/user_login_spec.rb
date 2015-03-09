require 'rails_helper'


describe 'authenticates user' do

  before :each do
    @user = User.create(user_name: 'josh', password: 'foobar')
  end

  it 'allows valid user to log in' do

    visit '/login'

    fill_in 'User name', :with => @user.user_name

    fill_in 'Password', :with => @user.password

    click_button "Log in"

    expect(page).to have_content "Hey josh"
  end

  it 'blocks invalid user from logging in' do

    visit '/login'

    fill_in 'User name', :with => "Frank"

    fill_in 'Password', :with => "foobar"

    click_button "Log in"

    expect(page).to have_content "jackass"
  end

end
