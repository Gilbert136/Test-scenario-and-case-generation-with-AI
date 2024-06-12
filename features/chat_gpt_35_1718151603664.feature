Feature: Bank Account Login and Account Balance Checking
  Background:
    Given the user has a bank account
    And the user has the correct username and password

  @login
  Scenario Outline: User can successfully login with correct credentials
    Given the user has the correct username "<username>" and password "<password>"
    When the user logs into the bank account
    Then the login is successful

    @test @dev
    Examples:
      | username | password |
      | user1    | pass123  |
      | user2    | pass456  |

@failedlogin
  Scenario Outline: User cannot login with incorrect credentials
    Given the user has incorrect username "<username>" or password "<password>"
    When the user tries to log into the bank account
    Then the login fails

    @test @dev
    Examples:
      | username | password |
      | user1    | wrongpass|
      | wronguser| pass123  |

@viewbalance
  Scenario Outline: User can view account balance after successful login
    Given the user is logged into the bank account
    When the user checks the account balance
    Then the account balance is displayed

    @test @dev
    Examples:
      | username | password |
      | user1    | pass123  |
      | user2    | pass456  |

@nobalancepermission
  Scenario Outline: User without permission cannot view account balance
    Given the user is logged into the bank account
    And the user does not have permission to view account balance
    When the user tries to check the account balance
    Then the account balance is not displayed

    @test @dev
    Examples:
      | username | password |
      | user3    | pass789  |
      | user4    | pass000  |