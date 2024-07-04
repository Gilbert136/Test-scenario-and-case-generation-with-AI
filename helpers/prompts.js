export const system_prompt_zero_shot = `You are a Quality assurance engineer.`

export const system_prompt_few_shot_instruction =  
`1. Always start BDD gherkin syntax with 'Feature:' keyword. 
2. Use 'Scenario Outline:' and not 'Scenario:'. 
3. Always include Examples for each Scenario Outline. 
4. Include steps in the Background if they are repeated at the beginning of all Scenario Outline in a Feature. 
5. Background step should come before every Scenario Outline. 
6. Tags are written with '@{descriptive-test}' {descriptive-test}=summary of the individual Feature or Scenario Outline. 
7. Put summary tags at the line on top of only 'Feature:' and 'Scenario Outline:' and not 'Examples:' to annotate it. 
8. Use only '@test @dev' to annotate Examples. 
9. Include comments if possible.`

export const system_prompt_few_shot = 
`You are a Quality assurance engineer. You are an expect in writing test scenarios with test cases in BDD Gherkin style. 
You always take into consideration all edge cases and includes both positive and negative scenarios. 
You always write test scenarios with test cases and include add examples to each. 
You always follow a set of instructions to create test scenarios with test cases. 
You always follow the instructions below: 
${system_prompt_few_shot_instruction}`

export const system_prompt_few_shot_rag = 
`You are a Quality assurance engineer. You are an expect in writing test scenarios with test cases in BDD Gherkin style. 
You always take into consideration all edge cases and includes both positive and negative scenarios. 
You always write test scenarios with test cases and include add examples to each. 
You always follow a set of instructions to create test scenarios with test cases. 
You always follow the instructions below: 
{instructions}`

export const user_goal = `I want to send and withdraw money by adults and non-adults, so that I can be able to make transactions for my business.`

export const prompt_action = `Write at least six positive and negative test scenarios with cases.`

export const prompt_output = `Using BDD Gherkin syntax only.`

export const prompt_placeholder = `Follow these criterias:`

export const prompt_output_regenerate = `Regenerate with gherkin syntax.`

export const prompt_output_reformat = `Reformat with gherkin syntax.`

export const prompt_context = 
`User should be an adult. User should be able to withdraw money if adult. User should be able to send money if adult. User should not be able to send more than 20 euros of money if not adult. User should be able to send any amount of money if I am only an adult. `

export const user_prompt_few_shot = 
`${user_goal} ${prompt_action} ${prompt_output} 
${prompt_placeholder} 
${prompt_context} 
`
export const user_prompt_rag = 
`{goal} ${prompt_action} ${prompt_output} 
${prompt_placeholder} 
{criterias}`;

export const retrieval_prompt_rag = 
`Generate acceptance criteria for this user story: {input} 
Do not number or bullet the results
Using the information below as context: 
{context}.`;

export const assistant_prompt_few_shot = 
`
Feature: Money Transactions for Adults and Non-Adults

  Background: 
    Given a user is an adult 
          
  @withdraw 
  Scenario Outline: Adult user can withdraw money 
    Given the user is an adult 
    When the user withdraws <amount> euros 
    Then the withdrawal is successful 
          
    @test @development 
    Examples: 
      | amount | 
      | 50     | 
      | 100    | 
          
  @send 
  Scenario Outline: Adult user can send money 
    Given the user is an adult 
    When the user sends <amount> euros 
    Then the money transfer is successful 
          
    @test @development 
    Examples: 
      | amount | 
      | 30     | 
      | 50     | 
          
  @non_adult_send_over_limit 
  Scenario Outline: Non-adult user trying to send over 20 euros 
    Given the user is not an adult 
    When the user tries to send <amount> euros 
    Then the transaction is rejected 
          
    @test @development 
    Examples: 
      | amount | 
      | 25     | 
      | 30     | 
          
  @adult_send_over_limit 
  Scenario Outline: Adult user sending over limit 
    Given the user is an adult 
    When the user sends <amount> euros 
    Then the money transfer is successful 
          
    @test @development 
    Examples: 
      | amount | 
      | 100    | 
      | 200    |
          
  @non_adult_withdraw 
  Scenario Outline: Non-adult user trying to withdraw money 
    Given the user is not an adult 
    When the user tries to withdraw <amount> euros 
    Then the transaction is rejected 
          
    @test @development 
    Examples: 
      | amount | 
      | 20     | 
      | 50     |
          
  @adult_withdraw 
  Scenario Outline: Adult user can withdraw any amount 
    Given the user is an adult 
    When the user withdraws <amount> euros 
    Then the withdrawal is successful 
          
    @test @development 
    Examples: 
      | amount | 
      | 50     | 
      | 100    |
      
`

export const prompt_criterias = [
  `I want to login to my bank account, so that I can be able to check my bank account balance. ${prompt_action} ${prompt_output}
  ${prompt_placeholder} 
  I should be able to login into bank account if username and password are correct. 
  I can not log into bank account if username and password are not correct. 
  I should  view bank balance if the user is login and have permission to view account balance. 
  I should not view account balance if they are login and do not have permission to view account balance.`,

  `I want to be able to create an account, so that I can create my own profile. ${prompt_action} ${prompt_output}
  ${prompt_placeholder} 
  I should be able to create an account if I do not have an exist account.
  I should be able to create a profile if I have an account
  I should not be able to create a profile if I do not have an account.
  I should not be able to create a profile if I do not remember my account username and password.`,

  `I want to buy the right size cloths for a boy and a girl, so that I can be able to fix the boy and girl with the right size cloths. ${prompt_action} ${prompt_output}
  ${prompt_placeholder} 
  I should be able to buy boy cloths between size 20 to 30. 
  I should be able to buy girl cloths between 20 to 25. 
  I should be able to buy boy and girl cloths if right size exist else do not buy. 
  I should be able to buy girl cloths for boy if boy cloths size fit girl. 
  I should be able to buy boy cloths for girl if girl cloth size fit boy. 
  I should be able to buy no cloth if it does not fit boy or girl.`,

  `I want to view user documentation for the website, so that I know how to use the web app. ${prompt_action} ${prompt_output}
  ${prompt_placeholder} 
  I should be able to know how to use the web app if there is a user documentation on the website.
  I should be able to know how to use the web app if the user documentation is easy to understand.
  I should not be able to know how to use the web app if there is no user documentation.
  I should not be able to know how to use the web app if the user documentation page is down`,

  `I want to be able to view a map display of the special waste drop off sites around my area, so that I know where to drop of my special waste. ${prompt_action} ${prompt_output} 
  ${prompt_placeholder} 
  I should be able to see special waste site on map if there is any special waste drop off available.
  I should be able to see special waste site on map if the GPS works correctly.
  I should not be able to see special waste site on map if there is not any special waste drop off available.
  I should not be able to see special waste site on map if the internet connection is down`,

  `I want to view all available activity fees online, so that I can easily create a bill statement. ${prompt_action} ${prompt_output}
  ${prompt_placeholder} 
  I should be able to view some activities fees online if I plan to create a bill statement.
  I should be able to view all activities fees online if I plan to create a bill statement.
  I should be able to view all activities fees online if I plan not to create a bill statement.
  I should not be able to view all activities fees online if the network is down.
  I should not be able to view all activities fees online if there are no activities fees online`,

  `I want to be able to receive tempting rewards, so that I have a reason to use the website. ${prompt_action} ${prompt_output}
  ${prompt_placeholder}  
  I should be able to receive tempting rewards if I want to use the website.
  I should not be able to receive tempting rewards if I do not want to use the website.
  I should not be able to receive tempting rewards if I want to use the website and do not want any reward.`,

  `I want to access an API from the website, so that I can integrate it and implement certain features in my own iOS application. ${prompt_action} ${prompt_output}
  ${prompt_placeholder} 
  I should be able to access an API if the access is free.
  I should be able to access an API if I have the API access key.
  I should not be able to access an API if the access key has expired.
  I should not be able to access an API if the access key is wrong.
  I should be able to access an API if the access key has the correct permissions.`,

  `I want to have full access to data related to my company, so that I can have a sense of my company's performance. ${prompt_action} ${prompt_output}
  ${prompt_placeholder} 
  I should be able to have full access to company data if I have full access priviledge to the data.
  I should be able to have full access to company data if company data has no restrictions to access.
  I should not be able to have full access to company data if I do not have full access priviledge to the data.
  I should be able to have full access to company data if company data has some restrictions to access.
  I should not be able to have full access to company data if I do not have the correct access priviledge to the data`,

  `I want to be able to block specific users based on IP address, so that I can prevent spamming on the websites. ${prompt_action} ${prompt_output}
  ${prompt_placeholder} 
  I should be able to block specific users based on IP address if user IP address is on the blocking list.
  I should not be able to block specific users based on IP address if user IP address is not on the blocking list.`,

  `I want to be able to check transaction history and keep a record of it, so that I can go back when needed. ${prompt_action} ${prompt_output}
  ${prompt_placeholder} 
  I should be able to check transaction history and keep a record of transaction history if I have the permission to check transaction history and keep record.
  I should not be able to check transaction history and keep a record of transaction history if I do not have the permission to check transaction history and keep record.
  I should be able to check only transaction history and not keep a record of transaction history if I have the permission to check transaction history and not keep record.
  I should be able to check transaction history and keep a record of it if I want to keep record.
  I should be able to keep a record of transaction history if I have only permission to check transaction history`,

  `I want to sending and withdrawing money by adults and non-adults, so that I can be able to make transactions for my business. ${prompt_action} ${prompt_output}
  ${prompt_placeholder} 
  I should be an adult. 
  I should be able to withdraw money if adult. 
  I should be able to send money if adult. 
  I should not be able to send more than 20 euros of money if not adult. 
  I should be able to send any amount of money if I am only an adult. `
]
