Given(/^I visit the feedback tool$/) do
  visit feedback.submissions_path
end

When(/^I leave feedback$/) do
  feedback_body = 'Some feedback.'
  fill_in 'submission_body', with: feedback_body
  click_button 'Create Submission'
end

Then(/^I should see a confirmation message$/) do
  expect(page).to have_content('Thanks for letting us know Your feedback')
end

Given(/^I visit a tool$/) do
  visit feedback.root_path
end

When(/^I submit feedback about that tool$/) do
  feedback_body = 'Some feedback.'
  visit feedback.submissions_path
  fill_in 'submission_body', with: feedback_body
  click_button 'Create Submission'
end

Then(/^I should be able to navigate back to the tool$/) do
  click_link 'Back to tool'
  expect(page).to have_content('Improve this page')
end
