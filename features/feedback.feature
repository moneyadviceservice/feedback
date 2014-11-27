Feature: Customer feedback

As a user
I want to submit feedback on aspects of the money advice service's website and tools
So that they can enhance their service to my needs

Scenario: Submit Feedback
  Given I visit the feedback tool
  When I leave feedback
  Then I should see a confirmation message

Scenario: Return to originating place
  Given I visit a tool
  When I submit feedback about that tool
  Then I should be able to navigate back to the tool
