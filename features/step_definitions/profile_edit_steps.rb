When /^I fill in the image url with "(.*)"$/ do |url|
    page.fill_in 'user_img_url', with: url 
end

Then /^The image url "(.*)" should be in the HTML$/ do |url|
    expect(page).to have_css("image[src*='#{url}']")
end