import OpenAI from "openai";
import { writeFile, existsSync, mkdirSync, createReadStream, createWriteStream } from 'fs';
import jsonl from 'jsonl';


function save_file(directory_name, file_name, content) {
    if (!existsSync(directory_name)){
        mkdirSync(directory_name, { recursive: true });
    }

    const path = directory_name + file_name
    writeFile(path, content, (err) => {
        if (err) throw err;
        console.log('The file has been saved!');
    });
}

async function generate_results(api_key) {
    const client = new OpenAI({ apiKey: api_key });
    const system_prompt = 
    `
    You are a Quality assurance engineer. You are an expect in writing test scenarios with test cases. 
    You always take into consideration all edge cases and includes both positive and negative scenarios. 
    You use the BDD Gherkin style. You always follows a set of instructions to create test scenarios with test cases. 
    You always write at least three test scenarios with test cases. The following below are the {instructions} that you always follows.  
    {instructions}=1. Always start BDD Gherkin style with 'Feature:' keyword. 2. Use 'Scenario Outline:' instead of 'Scenario:'. 
    3. Include steps in the Background if they are repeated at the beginning of all Scenario Outline in a Feature. 
    4. Background step should come before every Scenario Outline. 5. Tags are written with '@{descriptive-test}' {descriptive-test}=summary of the individual Feature or Scenario Outline. 
    6. Put tags at the line on top of only Feature and Scenario Outline and not Examples to annotate it. 7.  Include Examples for each Scenario Outline. 8.  Use '@test @dev' to annotate Examples. 9. Include comments
    `;
    const user_prompt = 
    `
    I want to sending and withdrawing money by adults and non-adults, so that I can be able to make transactions for my business.
    Write at least three test scenarios with cases.  Using BDD Gherkin style. 
    Follow these criteria. User should be an adult. User should be able to withdraw money if adult. 
    I should be able to send money if adult. 
    I should not be able to send more than 20 euros of money if not adult. 
    I should be able to send any amount of money if I am only an adult.
    `
    const few_shot_prompt_with_assistant = 
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
    let criterias = [
        `I want to login to my bank account, so that I can be able to check my bank account balance. 
        Write at least three test scenarios with cases.  
        Using BDD Gherkin style. Follow these criteria. 
        I should be able to login into bank account if username and password are correct. 
        I can not log into bank account if username and password are not correct. 
        I should  view bank balance if the user is login and have permission to view account balance. 
        I should not view account balance if they are login and do not have permission to view account balance.`,

        `I want to be able to create an accunt, so that I can create my own profile.
        write at least three test scenarios with cases.  
        Using BDD Gherkin style. Follow these criteria. 
        I should be able to create an account if I do not have an exist account.
        I should be able to create a profile if I have an account
        I should not be able to create a profile if I do not have an account.
        I should not be able to create a profile if I do not remember my account username and password.`,

        `I want to buy the right size cloths for a boy and a girl, so that I can be able to fix the boy and girl with the right size cloths.
        Write at least three test scenarios with cases.  
        Using BDD Gherkin style. Follow these criteria. 
        I should be able to buy boy cloths between size 20 to 30. 
        I should be able to buy girl cloths between 20 to 25. 
        I should be able to buy boy and girl cloths if right size exist else do not buy. 
        I should be able to buy girl cloths for boy if boy cloths size fit girl. 
        I should be able to buy boy cloths for girl if girl cloth size fit boy. 
        I should be able to buy no cloth if it does not fit boy or girl.`,

        `I want to view user documentation for the website, so that I know how to use the web app.
        write at least three test scenarios with cases.  
        Using BDD Gherkin style. Follow these criteria. 
        I should be able to know how to use the web app if there is a user documentation on the website.
        I should be able to know how to use the web app if the user documentation is easy to understand.
        I should not be able to know how to use the web app if there is no user documentation.
        I should not be able to know how to use the web app if the user documentation page is down`,

        `I want to be able to view a map display of the special waste drop off sites around my area, so that I know where to drop of my special waste.
        write at least three test scenarios with cases.  
        Using BDD Gherkin style. Follow these criteria.
        I should be able to see special waste site on map if there is any special waste drop off available.
        I should be able to see special waste site on map if the GPS works correctly.
        I should not be able to see special waste site on map if there is not any special waste drop off available.
        I should not be able to see special waste site on map if the internet connection is down`,

        `I want to view all available activity fees online, so that I can easily create a bill statement.
        write at least three test scenarios with cases.  
        Using BDD Gherkin style. Follow these criteria. 
        I should be able to view some activities fees online if I plan to create a bill statement.
        I should be able to view all activities fees online if I plan to create a bill statement.
        I should be able to view all activities fees online if I plan not to create a bill statement.
        I should not be able to view all activities fees online if the network is down.
        I should not be able to view all activities fees online if there are no activities fees online`,

        `I want to be able to receive tempting rewards, so that I have a reason to use the website.
        write at least three test scenarios with cases.  
        Using BDD Gherkin style. Follow these criteria. 
        I should be able to receive tempting rewards if I want to use the website.
        I should not be able to receive tempting rewards if I do not want to use the website.
        I should not be able to receive tempting rewards if I want to use the website and do not want any reward.`,

        `I want to access an API from the website, so that I can integrate it and implement certain features in my own iOS application.
        write at least three test scenarios with cases.  
        Using BDD Gherkin style. Follow these criteria. 
        I should be able to access an API if the access is free.
        I should be able to access an API if I have the API access key.
        I should not be able to access an API if the access key has expired.
        I should not be able to access an API if the access key is wrong.
        I should be able to access an API if the access key has the correct permissions.`,

        `I want to have full access to data related to my company, so that I can have a sense of my company's performance.
        write at least three test scenarios with cases.  
        Using BDD Gherkin style. Follow these criteria. 
        I should be able to have full access to company data if I have full access priviledge to the data.
        I should be able to have full access to company data if company data has no restrictions to access.
        I should not be able to have full access to company data if I do not have full access priviledge to the data.
        I should be able to have full access to company data if company data has some restrictions to access.
        I should not be able to have full access to company data if I do not have the correct access priviledge to the data`,

        `I want to be able to block specific users based on IP address, so that I can prevent spamming on the websites.
        write at least three test scenarios with cases.  
        Using BDD Gherkin style. Follow these criteria.
        I should be able to block specific users based on IP address if user IP address is on the blocking list.
        I should not be able to block specific users based on IP address if user IP address is not on the blocking list.`,

        `I want to be able to check transaction history and keep a record of it, so that I can go back when needed.
        write at least three test scenarios with cases.  
        Using BDD Gherkin style. Follow these criteria. 
        I should be able to check transaction history and keep a record of transaction history if I have the permission to check transaction history and keep record.
        I should not be able to check transaction history and keep a record of transaction history if I do not have the permission to check transaction history and keep record.
        I should be able to check only transaction history and not keep a record of transaction history if I have the permission to check transaction history and not keep record.
        I should be able to check transaction history and keep a record of it if I want to keep record.
        I should be able to keep a record of transaction history if I have only permission to check transaction history`,

        `I want to sending and withdrawing money by adults and non-adults, so that I can be able to make transactions for my business.
        Write at least three test scenarios with cases.  Using BDD Gherkin style. 
        Follow these criteria. 
        I should be an adult. 
        I should be able to withdraw money if adult. 
        I should be able to send money if adult. 
        I should not be able to send more than 20 euros of money if not adult. 
        I should be able to send any amount of money if I am only an adult. `
    ]


    let json_result = await Promise.all(criterias.map(async (criteria) => {
        const chat_completion = await client.chat.completions.create({
            messages: [
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt},
                {"role":"assistant","content": few_shot_prompt_with_assistant},
                {"role": "user", "content": criteria},
            ],
            model: "gpt-3.5-turbo",
        });
        let fine_tuning_data = {
            "messages": [
                {
                    "role": "system",
                    "content": system_prompt
                },
                {
                    "role": "user",
                    "content": criteria
                },
                {
                    "role": "assistant",
                    "content": chat_completion.choices[0].message.content
                }
            ]
        }
        console.log(fine_tuning_data)
        return fine_tuning_data
    }))

      const directory_name = './training_data/' 
      const file_name = `fine_tuning_datas4`
      const file_name_json = `${file_name}.json`
      const path = `${directory_name}${file_name}`

      save_file(directory_name, file_name_json, JSON.stringify(json_result, null, 2))
      convert_json_jsonL(path)
}

function convert_json_jsonL(path){
    createReadStream(`${path}.json`)
        .pipe(jsonl())
        .pipe(createWriteStream(`${path}.jsonl`))
}

const directory_name = './training_data/' 
const file_name = `fine_tuning_datas4`
const path = `${directory_name}${file_name}`

async function upload_jsonl_to_openai(api_key, path){
    const client = new OpenAI({ apiKey: api_key });
    const response = await client.files.create({ 
        file: createReadStream(`${path}.jsonl`), 
        purpose: 'fine-tune' });
    const file_id = response['id']
    console.log(`File was successfully uploaded with id ${file_id}`)
}

async function create_fine_tuning_job(api_key, file_id){
    const client = new OpenAI({ apiKey: api_key });
    const response = await client.fineTuning.jobs.create({   
        model: "gpt-3.5-turbo",
        training_file: file_id})
    const job_id = response['id']
    console.log(`Fine-tuning job was successfully created with id ${job_id}`)
}

//await generate_results(`sk-proj-EVPqFWANWV22tYV6yU5KT3BlbkFJdHqcWu3OhheEAlGfPRLS`)
//await upload_jsonl_to_openai(`sk-proj-EVPqFWANWV22tYV6yU5KT3BlbkFJdHqcWu3OhheEAlGfPRLS`, path)
await create_fine_tuning_job(`sk-proj-EVPqFWANWV22tYV6yU5KT3BlbkFJdHqcWu3OhheEAlGfPRLS`, `file-zZ82HN84LTmXlXhWBX92R0oa`);