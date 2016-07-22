require 'rails_helper'
RSpec.feature 'Sign in', type: :feature do
  given(:user) { build(:user) }
  given(:proto) {build(:prototype)}

  def sign_up
    visit root_path
    click_link 'GET STARTED'
    click_link 'Sign up NOW'
    fill_in 'Username', with: user.nickname
    fill_in 'E-Mail', with: user.email
    fill_in 'password', with: user.password
    fill_in 'password(Confirm)', with: user.password_confirmation
    fill_in 'Member', with: user.member
    fill_in 'Profile', with: user.profile
    fill_in 'Works', with: user.work
    click_on 'Create User'
  end

  def sign_in
    sign_up
    sign_out
    visit root_path
    click_link 'GET STARTED'
    fill_in 'Email address', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
  end

  def sign_out
    page.first(".dropdown-toggle").click
    click_on 'Sign out'
  end

  def posting_prototype
    sign_in
    click_on 'NEW PROTO'
    fill_in 'Title', with: proto.title
    attach_file "prototype[protoimages_attributes][0][thumbnail]", "#{Rails.root}/tmp/capybara/sample.png", visible: false
    1.upto(3) do |i|
      attach_file "prototype[protoimages_attributes][#{i}][thumbnail]", "#{Rails.root}/tmp/capybara/sample.png", visible: false
    end
    fill_in 'Catch Copy', with: proto.catch_copy
    fill_in 'Concept', with: proto.concept
    click_on 'Publish'
    page.save_screenshot 'post_success.png'
  end

  scenario 'User`s sign_up and posting prototype', js: true do
    posting_prototype
    expect(page).to have_selector '.alert-success', text: 'Your prototype has created successfully.'
  end

  scenario 'User`s sign_in', js: true do
    sign_in
    page.save_screenshot 'sign_in_success.png'
    expect(page).to have_selector '.alert-success', text: 'Signed in successfully.'
  end

  scenario 'User`s sign_up', js: true do
    sign_up
    page.save_screenshot 'sign_up_success.png'
    expect(page).to have_selector '.alert-success', text: 'Welcome! You have signed up successfully.'
  end
end
