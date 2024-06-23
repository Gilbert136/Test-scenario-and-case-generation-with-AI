Feature: Money Transactions for Adults and Non-Adults

  Background:
    Given a user is an adult

  @withdraw
  Scenario Outline: Adult user can withdraw money
    Given the user is an adult
    When the user withdraws <amount> euros
    Then the withdrawal is successful

    @test @positive
    Examples:
      | amount |
      | 50     |
      | 100    |

  @send
  Scenario Outline: Adult user can send money
    Given the user is an adult
    When the user sends <amount> euros
    Then the money transfer is successful

    @test @positive
    Examples:
      | amount |
      | 30     |
      | 50     |

  @non_adult_send_over_limit
  Scenario Outline: Non-adult user trying to send over 20 euros
    Given the user is not an adult
    When the user tries to send <amount> euros
    Then the transaction is rejected

    @test @negative
    Examples:
      | amount |
      | 25     |
      | 30     |

  @adult_send_over_limit
  Scenario Outline: Adult user sending over limit
    Given the user is an adult
    When the user sends <amount> euros
    Then the money transfer is successful

    @test @positive
    Examples:
      | amount |
      | 100    |
      | 200    |

  @non_adult_withdraw
  Scenario Outline: Non-adult user trying to withdraw money
    Given the user is not an adult
    When the user tries to withdraw <amount> euros
    Then the transaction is rejected

    @test @negative
    Examples:
      | amount |
      | 20     |
      | 50     |

  @adult_withdraw
  Scenario Outline: Adult user can withdraw any amount
    Given the user is an adult
    When the user withdraws <amount> euros
    Then the withdrawal is successful

    @test @positive
    Examples:
      | amount |
      | 50     |
      | 100    |
  @non_adult_send_negative_balance
  Scenario: Non-adult user trying to send money with negative balance
    Given the user is not an adult
    And the user has a balance of 15 euros
    When the user tries to send 10 euros
    Then the transaction is rejected

    @test @negative

  @send_no_sufficient_funds
  Scenario: User trying to send money with insufficient funds
    Given the user is an adult
    And the user has a balance of 30 euros
    When the user tries to send 40 euros
    Then the transaction is rejected

    @test @negative

  @withdraw_no_sufficient_funds
  Scenario: User trying to withdraw money with insufficient funds
    Given the user is an adult
    And the user has a balance of 20 euros
    When the user tries to withdraw 30 euros
    Then the transaction is rejected

    @test @negative
