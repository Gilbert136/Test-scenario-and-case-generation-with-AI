
Feature: Money transactions for business 

  Scenario: Sending money as an adult
    Given the sender is an adult
    And the sender has sufficient balance
    When the sender initiates a money transfer
    Then the transaction is successfully completed

  Scenario: Sending money as a non-adult
    Given the sender is a non-adult
    And the sender has sufficient balance
    When the sender initiates a money transfer
    Then the transaction fails with an error message
    
  Scenario: Withdrawing money as an adult
    Given the account holder is an adult
    And the account has sufficient balance
    When the account holder requests a withdrawal
    Then the withdrawal is successful
    
  Scenario: Withdrawing money as a non-adult
    Given the account holder is a non-adult
    And the account has sufficient balance
    When the account holder requests a withdrawal
    Then the withdrawal fails with an error message
    
  Scenario: Sending money with insufficient balance
    Given the sender is an adult
    And the sender has insufficient balance
    When the sender initiates a money transfer
    Then the transaction fails with an error message
    
  Scenario: Withdrawing more money than the account balance
    Given the account holder is an adult
    And the account balance is less than the withdrawal amount
    When the account holder requests a withdrawal
    Then the withdrawal fails with an error message
  
Feature: Money transactions for business 

  Scenario: Sending money as an adult
    Given the sender is an adult
    And the sender has sufficient balance
    When the sender initiates a money transfer
    Then the transaction is successfully completed

  Scenario: Sending money as a non-adult
    Given the sender is a non-adult
    And the sender has sufficient balance
    When the sender initiates a money transfer
    Then the transaction fails with an error message
    
  Scenario: Withdrawing money as an adult
    Given the account holder is an adult
    And the account has sufficient balance
    When the account holder requests a withdrawal
    Then the withdrawal is successful
    
  Scenario: Withdrawing money as a non-adult
    Given the account holder is a non-adult
    And the account has sufficient balance
    When the account holder requests a withdrawal
    Then the withdrawal fails with an error message
    
  Scenario: Sending money with insufficient balance
    Given the sender is an adult
    And the sender has insufficient balance
    When the sender initiates a money transfer
    Then the transaction fails with an error message
    
  Scenario: Withdrawing more money than the account balance
    Given the account holder is an adult
    And the account balance is less than the withdrawal amount
    When the account holder requests a withdrawal
    Then the withdrawal fails with an error message