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

Then /^the "([^"]*)" checkbox(?: within (.*))? should be checked$/ do |label, parent|
  with_scope(parent) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_truthy
    else
      assert field_checked
    end
  end
end

Then /^the "([^"]*)" checkbox(?: within (.*))? should not be checked$/ do |label, parent|
  with_scope(parent) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_falsey
    else
      assert !field_checked
    end
  end
end

Then /^I should have the profile picture "(.+)"$/ do |image|
  page.should have_xpath("//image[@src = '#{image}']")
end

Then /^I should not have the profile picture "(.+)"$/ do |image|
  page.should_not have_xpath("//image[@src = '#{image}']")
end

#

#Given /^(?:|I )am on the (.+) page$/ do |page_name|
#  visit path_to(page_name)
#end

#And /^(?:|I )am a (.+)$/ do |membership|
#  case membership
#    when 'visitor'
#      level.eql? 'visitor'
#    when 'general member'
#      level.eql? 'general member'
#    else
#      level.eql? 'core member'
#  end
#end
