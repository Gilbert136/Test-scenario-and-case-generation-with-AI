**Feature: Money Sending and Withdrawing**

**Scenario: Sending and Withdrawing Money by Users**

    Given an adult user
    When the user wants to withdraw money
    Then the user should be able to withdraw money

    Given a non-adult user
    When the user wants to withdraw money
    Then the user should not be able to withdraw money

    Given an adult user
    When the user wants to send money
    Then the user should be able to send money

    Given a non-adult user
    When the user wants to send money
    Then the user should not be able to send money

    Given a non-adult user
    When the user tries to send more than 20 euros
    Then the transaction should be blocked

    Given an adult user
    When the user wants to send any amount of money
    Then the user should be able to send money