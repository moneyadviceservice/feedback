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

Given(/^I visit a tool$/) do
  visit feedback.root_path
end

When(/^I leave feedback about that tool$/) do
  visit feedback.submissions_path
  fill_in 'submission_body', with: @feedback
  click_button 'Create Submission'
end

Then(/^I should be able to navigate back to the tool$/) do
  click_link 'Back to tool'
  expect(page).to have_content('Improve this page')
end
