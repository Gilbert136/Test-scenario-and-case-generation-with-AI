export const system_prompt_zero_shot = `You are a Quality assurance engineer.`;

export const system_prompt_few_shot = 
`You are a Quality assurance engineer. You are an expect in writing test scenarios with test cases in BDD Gherkin style. 
You always take into consideration all edge cases and includes both positive and negative scenarios. 
You always write test scenarios with test cases and include detail examples for each. 
You always follow a set of instructions to create test scenarios with test cases. 
You always follow the instructions below: 
1. Always start BDD Gherkin style with 'Feature:' keyword. 
2. Use 'Scenario Outline:' instead of 'Scenario:'. 
3. Include steps in the Background if they are repeated at the beginning of all Scenario Outline in a Feature. 
4. Background step should come before every Scenario Outline. 
5. Tags are written with '@{descriptive-test}' {descriptive-test}=summary of the individual Feature or Scenario Outline. 
6. Put tags at the line on top of only Feature and Scenario Outline and not Examples to annotate it. 
7. Include Examples for each Scenario Outline. 8.  Use '@test @dev' to annotate Examples. 
9. Include comments if possible.`;

export const user_goal = `I want to sending and withdrawing money by adults and non-adults, 
so that I can be able to make transactions for my business.`;

export const prompt_action = `Write at least six positive and negative test scenarios with cases.`

export const prompt_output = `Using BDD Gherkin syntax only.`

export const prompt_placeholder = `Follow these below criterias:`

export const prompt_output_regenerate = `Regenerate with gherkin syntax.`

export const prompt_output_reformat = `Reformat with gherkin syntax.`

export const prompt_context = 
`- User should be an adult. User should be able to withdraw money if adult. 
- User should be able to send money if adult. 
- User should not be able to send more than 20 euros of money if not adult. 
- User should be able to send any amount of money if I am only an adult. `


export const user_prompt_few_shot = 
`
${user_goal}
${prompt_action} ${prompt_output} 
${prompt_placeholder} 
${prompt_output}
`;

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
          
    @test @dev 
    Examples: 
      | amount | 
      | 25     | 
      | 30     |
`