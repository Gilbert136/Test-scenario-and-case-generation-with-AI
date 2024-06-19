```gherkin
Feature: Money Transactions for Adults and Non-Adults

  Scenario: Sending money as an adult
    Given the sender is an adult
    And the sender has sufficient balance
    When the sender initiates a money transfer
    Then the transaction should be successful
    And the sender's balance should be updated

  Scenario: Sending money as a non-adult
    Given the sender is a non-adult
    When the sender tries to initiate a money transfer
    Then the transaction should be declined
    And an error message should be displayed

  Scenario: Withdrawing money as an adult
    Given the account holder is an adult
    And the account has sufficient balance
    When the account holder requests a withdrawal
    Then the withdrawal should be successful
    And the account balance should be updated

  Scenario: Withdrawing money as a non-adult
    Given the account holder is a non-adult
    When the account holder tries to withdraw money
    Then the withdrawal should be declined
    And an error message should be displayed

  Scenario: Sending money with insufficient balance
    Given the sender has insufficient balance
    When the sender tries to initiate a money transfer
    Then the transaction should be declined
    And an error message should be displayed

  Scenario: Withdrawing more money than account balance
    Given the account holder has a balance of $100
    When the account holder tries to withdraw $150
    Then the withdrawal should be declined
    And an error message should be displayed
```  