Feature: Customer feedback

As a user
I want to submit feedback on aspects of the money advice service's website and tools
So that they can enhance their service to my needs

Scenario: Submit Feedback
  Given I visit the feedback tool
  When I leave feedback
  Then I should see a confirmation message

Scenario: Return to originating place
  Given I am in the home page
  When I visit feedback tool
  And I submit my feedback
  Then I should be able to navigate back to the tool
