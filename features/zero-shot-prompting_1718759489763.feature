```gherkin
Feature: Sending and Withdrawing Money for Adults and Non-Adults

Scenario: Adult user can withdraw money
    Given the user is an adult
    When the user withdraws money
    Then the transaction is successful

Scenario: Adult user can send money
    Given the user is an adult
    When the user sends money
    Then the transaction is successful

Scenario: Non-adult user cannot send more than 20 euros
    Given the user is not an adult
    And the user tries to send 25 euros
    Then the transaction fails with a message that the user can only send up to 20 euros

Scenario: Non-adult user cannot withdraw money
    Given the user is not an adult
    And the user tries to withdraw money
    Then the transaction fails with a message that only adults can withdraw money

Scenario: Adult user can send any amount of money
    Given the user is an adult
    And the user sends any amount of money
    Then the transaction is successful

Scenario: Non-adult user cannot send money
    Given the user is not an adult
    When the user tries to send money
    Then the transaction fails with a message that only adults can send money
```  