@Transaction 
Feature: Money Transactions for Adults and Non-Adults

  Background:
    Given I am a registered user
    And I am an adult

  Scenario: Adult User Sending Money
    Given my account balance is 100 euros
    When I send 50 euros to another user
    Then the transaction is successful
    And my account balance is now 50 euros

  Scenario: Adult User Withdrawing Money
    Given my account balance is 100 euros
    When I withdraw 30 euros from my account
    Then the withdrawal is successful
    And my account balance is now 70 euros




"Use the folowing {instruction} and {criteria}. 
{instruction}=1. Always start BDD style with 'Feature:' keyword. 
              2. Use 'Scenario Outline:' instead of 'Scenario:'.
              3. Include steps in the Background if they are repeated at the beginning of all scenarios in a feature.
              4. Background step should come before every scenario.
              5. Use Tags to annotate Feature, Background, Scenario.
              6. Tags are written the '@' symbol followed by a summary text. 
{criteria}=User should be an adult. User should be able to withdraw money if adult. User should be able to send money if adult. Block not adult users from sending more than 20 euros of money. Only adult user can send any amount of money. "'




"Feature: Money Transactions for Adults and Non-Adults\n

Background:
    Given a user is an adult

@withdraw
Scenario Outline: Adult user can withdraw money
    Given the user is an adult
    When the user withdraws <amount> euros
    Then the withdrawal is successful

    @withdrawal
    @test @dev
    Examples:
      | amount |
      | 50     |
      | 100    |

@send
Scenario Outline: Adult user can send money
    Given the user is an adult
    When the user sends <amount> euros
    Then the money transfer is successful

    @money-transfer
    @test @dev
    Examples:
      | amount |
      | 30     |
      | 50     |

@block
Scenario Outline: Non-adult user sending over 20 euros is blocked
    Given the user is not an adult
    When the user tries to send <amount> euros
    Then the transaction is blocked

    @block-non-adult
    @test @dev
    Examples:
      | amount |
      | 25     |
      | 30     |
"