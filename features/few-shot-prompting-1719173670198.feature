Feature: Next Steps after Signing Up

  Background:
    Given a user has signed up successfully

  @navigate_to_dashboard
  Scenario: User navigates to dashboard after signing up
    When the user logs in with valid credentials
    Then the user is redirected to the dashboard

  @complete_profile
  Scenario: User completes profile after signing up
    Given the user has signed up but not completed profile
    When the user completes their profile information
    Then the profile is successfully updated

  @explore_features
  Scenario: User explores features after signing up
    Given the user has signed up and completed profile
    When the user navigates to the features section
    Then the user can explore different features available

  @make_first_transaction
  Scenario: User makes their first transaction after signing up
    Given the user has signed up and explored features
    When the user initiates their first transaction
    Then the transaction is successful

  @contact_support
  Scenario: User contacts support after signing up
    Given the user has signed up and explored features
    When the user faces an issue and contacts support
    Then the user receives timely assistance

  @upgrade_account
  Scenario: User upgrades their account after signing up
    Given the user has signed up and explored features
    When the user decides to upgrade their account
    Then the account is successfully upgraded

  @examples
  Examples:
    | scenario              |
    | navigate_to_dashboard |
    | complete_profile      |
    | explore_features      |
    | make_first_transaction|
    | contact_support       |
    | upgrade_account       |

  @invalid_login
  Scenario: User tries to login with invalid credentials
    Given the user has signed up
    When the user attempts to login with incorrect credentials
    Then the login is unsuccessful

  @incomplete_profile
  Scenario: User tries to access features with incomplete profile
    Given the user has signed up but not completed profile
    When the user tries to access features section
    Then the access is denied until profile completion

  @unsuccessful_first_transaction
  Scenario: User's first transaction is unsuccessful
    Given the user has signed up and explored features
    When the user tries to make their first transaction but it fails
    Then the transaction is unsuccessful

  @no_response_support
  Scenario: User does not receive response from support
    Given the user has signed up and contacted support
    When the user does not receive any response within a reasonable time
    Then the support response is considered delayed

  @account_downgrade
  Scenario: User tries to downgrade account after signing up
    Given the user has signed up and explored features
    When the user attempts to downgrade their account
    Then the account downgrade request is rejected

  @examples
  Examples:
    | scenario              |
    | invalid_login         |
    | incomplete_profile    |
    | unsuccessful_first_transaction |
    | no_response_support   |
    | account_downgrade     |