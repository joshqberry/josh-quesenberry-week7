require 'rails_helper'

describe 'Checks that users can successfully CRUD courses' do

  before :each do
    @user = User.create(id: 1, user_name: 'josh', password: 'foobar', about: "I'm all right")

    visit '/login'

    fill_in 'User name', :with => @user.user_name

    fill_in 'Password', :with => @user.password

    click_button "Log in"

    @course = @user.courses.create(id: 1, title: "50 Shades of Great Expectations",
    day_or_night: true)

  end

  it 'allows user to create course' do

    visit '/courses/new'

    fill_in 'Title', :with => "Beer Pong Basics"

    check 'Click here if this course is at night:'

    click_button "Add your course"

    expect(page).to have_content "I'm all right"
  end

  it 'allows user to read and edit course' do

    visit '/courses/1'

    expect(page).to have_content "50 Shades"

    visit '/courses/1/edit'

    fill_in 'Title', :with => "Trends in Togas"

    check 'Click here if this course is at night:'

    click_button "Update your course"

    expect(page).to have_content "successfully"
  end

    it 'allows user to delete courses' do

    visit '/users/1'

    expect(page).to have_content "50 Shades"

    click_link "Delete course from schedule"

    expect(page).to have_content "ceased"
  end
end
