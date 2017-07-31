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

And /^(?:|I )upload "(.*)"$/ do |filename|
  page.attach_file('resource_attachment', File.join(Rails.root, 'features', 'testfiles', filename))
end

And /^The "(.*)" file exists$/ do |filename|
  test_file = fixture_file_upload('features/testfiles/test_file.txt', 'text', true)
  Resource.new(:title => filename, :attachment => test_file).save!
end

When /^(?:|I )have "(.*)" access$/ do |auth|
  pending
end

Then /^I should be shown the image "(.+)"$/ do |image|
  # page.should have_xpath("//img[@src=\"/public/images/#{image}\"]")
  pending
end