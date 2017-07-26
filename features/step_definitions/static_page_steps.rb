
require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Then /^I should see (.*)$/ do |text|
  case text
    when 'the nav bar'
      expect(page).to have_selector('nav')
    else
      expect(page).to have_content(text)
  end
end

Then /^I (dont )?have an account for (.*@.*) with password (.*)$/ do |dont, email, password|
  step "I follow Log Out"
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"
  step "I should be on the home page" if dont != "dont "
  step "I should be on the sign in page" if dont == "dont "
end

Given /^I do not have an account$/ do
  pending
end

Given /^I am not logged in$/ do

end

Given /^I am logged in$/ do
  fname = 'Da'
  lname = 'Tong'
  email = 'datongtest@datong.berkeley.edu'
  password = 'hunter2'
  User.new(:fname => fname, :lname => lname, :email => email, :password => password, :password_confirmation => password).save!
  user = User.first
  user.confirm
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"
end

When /^(?:|I )follow (.*)$/ do |link|
    click_link(link)
end

And /^I should not see (.*)$/ do |text|
  expect(page).not_to have_content(text)
end
