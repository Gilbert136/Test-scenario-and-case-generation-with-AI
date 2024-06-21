
Feature: User Documentation for Website

  Background: 
    Given the user has access to the website's user documentation 
            
  @easy-to-understand
  Scenario Outline: User can understand how to use the web app with easy-to-understand documentation 
    Given the user has access to easy-to-understand user documentation 
    When the user reads the documentation 
    Then the user knows how to use the web app 

    @test @dev 
    Examples: 
      | documentation_type | 
      | video tutorial     | 
      | interactive guide   | 
          
  @no-documentation 
  Scenario: User cannot know how to use the web app without user documentation 
    Given the user does not have access to user documentation 
    Then the user is unable to understand how to use the web app 
          
    @test @dev 

  @documentation-down 
  Scenario: User cannot access user documentation if the page is down 
    Given the user tries to access the user documentation page 
    When the documentation page is down 
    Then the user is unable to view the documentation 
          
    @test @dev      
  @multiple-languages
  Scenario Outline: User can view user documentation in multiple languages 
    Given the user has access to user documentation 
    When the user selects <language> for the documentation 
    Then the user can view the documentation in the selected language 

    @test @dev 
    Examples: 
      | language | 
      | English  | 
      | Spanish  | 
      
  @outdated-documentation 
  Scenario: User cannot understand how to use the web app with outdated documentation 
    Given the user has access to user documentation 
    When the user reads outdated documentation 
    Then the user may not understand how to use the latest features of the web app 
      
    @test @dev

  @broken-links
  Scenario: User is unable to access all parts of the user documentation due to broken links 
    Given the user is navigating through the user documentation 
    When the user encounters broken links 
    Then the user may miss important information on how to use certain features of the web app 
          
    @test @dev       
Feature: User Documentation for Website

  Background: 
    Given the user has access to the website's user documentation 
            
  @easy-to-understand
  Scenario Outline: User can understand how to use the web app with easy-to-understand documentation 
    Given the user has access to easy-to-understand user documentation 
    When the user reads the documentation 
    Then the user knows how to use the web app 

    @test @dev 
    Examples: 
      | documentation_type | 
      | video tutorial     | 
      | interactive guide   | 
          
  @no-documentation 
  Scenario: User cannot know how to use the web app without user documentation 
    Given the user does not have access to user documentation 
    Then the user is unable to understand how to use the web app 
          
    @test @dev 

  @documentation-down 
  Scenario: User cannot access user documentation if the page is down 
    Given the user tries to access the user documentation page 
    When the documentation page is down 
    Then the user is unable to view the documentation 
          
    @test @dev      
    
  @multiple-languages
  Scenario Outline: User can view user documentation in multiple languages 
    Given the user has access to user documentation 
    When the user selects <language> for the documentation 
    Then the user can view the documentation in the selected language 

    @test @dev 
    Examples: 
      | language | 
      | English  | 
      | Spanish  | 
      
  @outdated-documentation 
  Scenario: User cannot understand how to use the web app with outdated documentation 
    Given the user has access to user documentation
    When the user reads outdated documentation 
    Then the user may not understand how to use the latest features of the web app 
      
    @test @dev

  @broken-links
  Scenario: User is unable to access all parts of the user documentation due to broken links 
    Given the user is navigating through the user documentation 
    When the user encounters broken links 
    Then the user may miss important information on how to use certain features of the web app 
          
    @test @dev       

  @confusing-instructions
  Scenario: User gets confused with contradictory instructions in the documentation 
    Given the user is reading the user documentation 
    When the user encounters conflicting or confusing instructions 
    Then the user may be unsure of how to proceed with using the web app 
          
    @test @dev       

  @missing-content
  Scenario: User cannot find specific information due to missing content in the documentation 
    Given the user is searching for specific information in the user documentation 
    When the user finds empty sections or missing content 
    Then the user may not be able to fully understand the functionalities of the web app 
          
    @test @dev       
