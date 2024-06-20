**Feature: Money Transactions for Business**

Scenario: Sending money by adults

Given an adult user wants to send money
When they enter the recipient's details and the amount
Then the money is successfully transferred

Scenario: Withdrawing money by adults

Given an adult user wants to withdraw money
When they enter the withdrawal amount
Then the money is deducted from their account

Scenario: Sending money by non-adults (Negative)

Given a non-adult user wants to send money
When they try to send money
Then the transaction is declined

Scenario: Withdrawing money by non-adults (Negative)

Given a non-adult user wants to withdraw money
When they try to withdraw money
Then the withdrawal request is denied

Scenario: Sending money exceeding limit by adults (Negative)

Given an adult user wants to send money
When they exceed the transaction limit
Then the transaction fails with an error message

Scenario: Insufficient balance for withdrawal by adults (Negative)

Given an adult user wants to withdraw money
When the withdrawal amount exceeds their balance
Then the withdrawal is declinedScenario: Sending money to non-existing recipient by adults (Negative)

Given an adult user wants to send money
When they enter the details of a recipient that does not exist
Then the transaction fails with an error message

Scenario: Withdrawing money with invalid withdrawal amount by adults (Negative)

Given an adult user wants to withdraw money
When they enter an invalid withdrawal amount (e.g., negative amount)
Then the withdrawal request is rejected

Scenario: Sending money with incorrect recipient details by adults (Negative)

Given an adult user wants to send money
When they input incorrect recipient details (e.g., wrong account number)
Then the transaction fails with an error

Scenario: Non-adult user attempting to bypass restrictions (Negative)

Given a non-adult user tries to bypass restrictions to send or withdraw money
When they try to manipulate the system or provide false information
Then the transaction is blocked and reported

Scenario: Withdrawal request pending approval by adults

Given an adult user initiates a withdrawal request
When the withdrawal amount exceeds a certain limit
Then the request is placed on hold pending approval by a higher authority

Scenario: Sending money to a blocked recipient by adults (Negative)

Given an adult user wants to send money
When they attempt to send money to a recipient who has been blocked
Then the transaction is blocked and the user is notified
Feature: Money Transactions for Business

Scenario: Sending money by adults
    Given an adult user wants to send money
    When they enter the recipient's details and the amount
    Then the money is successfully transferred

Scenario: Withdrawing money by adults
    Given an adult user wants to withdraw money
    When they enter the withdrawal amount
    Then the money is deducted from their account

Scenario: Sending money by non-adults (Negative)
    Given a non-adult user wants to send money
    When they try to send money
    Then the transaction is declined

Scenario: Withdrawing money by non-adults (Negative)
    Given a non-adult user wants to withdraw money
    When they try to withdraw money
    Then the withdrawal request is denied

Scenario: Sending money exceeding limit by adults (Negative)
    Given an adult user wants to send money
    When they exceed the transaction limit
    Then the transaction fails with an error message

Scenario: Insufficient balance for withdrawal by adults (Negative)
    Given an adult user wants to withdraw money
    When the withdrawal amount exceeds their balance
    Then the withdrawal is declined

Scenario: Sending money to non-existing recipient by adults (Negative)
    Given an adult user wants to send money
    When they enter the details of a recipient that does not exist
    Then the transaction fails with an error message

Scenario: Withdrawing money with invalid withdrawal amount by adults (Negative)
    Given an adult user wants to withdraw money
    When they enter an invalid withdrawal amount (e.g., negative amount)
    Then the withdrawal request is rejected

Scenario: Sending money with incorrect recipient details by adults (Negative)
    Given an adult user wants to send money
    When they input incorrect recipient details (e.g., wrong account number)
    Then the transaction fails with an error

Scenario: Non-adult user attempting to bypass restrictions (Negative)
    Given a non-adult user tries to bypass restrictions to send or withdraw money
    When they try to manipulate the system or provide false information
    Then the transaction is blocked and reported

Scenario: Withdrawal request pending approval by adults
    Given an adult user initiates a withdrawal request
    When the withdrawal amount exceeds a certain limit
    Then the request is placed on hold pending approval by a higher authority

Scenario: Sending money to a blocked recipient by adults (Negative)
    Given an adult user wants to send money
    When they attempt to send money to a recipient who has been blocked
    Then the transaction is blocked and the user is notified
  