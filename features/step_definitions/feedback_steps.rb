Given(/^I visit the feedback tool$/) do
  visit feedback.submissions_path
end

When(/^I leave feedback about savings and account creation$/) do
  @feedback ||= 'Thanks for letting us know Your feedback will be viewed by the team.'
  fill_in 'submission_body', with: @feedback
  click_button 'Create Submission'
end

Then(/^I should see a confirmation message$/) do
  expect(page).to have_content(@feedback)
end
