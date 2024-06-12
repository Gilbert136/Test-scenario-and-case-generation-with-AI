import OpenAI from "openai";
import promptSync from 'prompt-sync';
import { writeFile, existsSync, mkdirSync } from 'fs';

const prompt = promptSync({sigint: true});
const model_name = "chat_gpt_35"
const timestamp = new Date().getTime()

function get_query(prompts) {
    prompts.forEach(x => {
        if(x.ask) x.answer = prompt(x.question);
    });
    return prompts.reduce((full, first) => { return full+first.answer.trim()+". "}, "")
}

async function check_chatGPT_api_key_validity(client) {
    try {
        await client.models.list()
        return true
    } catch (error) {
        console.log(`OpenAI STATUS error ${error.code}`)
        return false
    }
}

async function chatGPT_client() {
    const api_key = prompt.hide("Insert openai api key: ")
    const client = new OpenAI({ apiKey: api_key });
    return await check_chatGPT_api_key_validity(client) ? client : null
}

async function prompt_chatGPT(client, prompts) {
    const query = get_query(prompts)
    const few_shot_user = prompts.reduce((full, first) => { return full+first.default.trim()+". "}, "")
    const few_shot_assistance = "Feature: Money Transactions for Adults and Non-Adults\n  Background:\n    Given a user is an adult\n\n  @withdraw\n  Scenario Outline: Adult user can withdraw money\n    Given the user is an adult\n    When the user withdraws <amount> euros\n    Then the withdrawal is successful\n\n    @test @dev\n    Examples:\n      | amount |\n      | 50     |\n      | 100    |\n\n@send\nScenario Outline: Adult user can send money\n    Given the user is an adult\n    When the user sends <amount> euros\n    Then the money transfer is successful\n\n    @test @dev\n    Examples:\n      | amount |\n      | 30     |\n      | 50     |\n\n@block\nScenario Outline: Non-adult user sending over 20 euros is blocked\n    Given the user is not an adult\n    When the user tries to send <amount> euros\n    Then the transaction is blocked\n\n    @test @dev\n    Examples:\n      | amount |\n      | 25     |\n      | 30     |\n\n"
    const chat_completion = await client.chat.completions.create({
        messages: [
            {"role": "system", "content": prompts[0]["answer"]},
            {"role": "user", "content": few_shot_user},
            {"role":"assistant","content": few_shot_assistance},
            {"role": "user", "content": query},
        ],
        model: "gpt-3.5-turbo",
      });
      const file_name = `${model_name}_${timestamp}.feature`  
      const directory_name = './features/'  

      console.log(chat_completion.choices[0].message.content)
      save_file(directory_name, file_name, chat_completion.choices[0].message.content)
}

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

async function main() {
    const client = await chatGPT_client()
    if (client == null) {
        console.log("You can find your API key at https://platform.openai.com/api-keys ")
    } else {
        const prompts = [
            { "name" : "Persona",       "question": "[Persona] Enter persona: ",                     "answer": "",      ask: true, default: "You are a Quality Analyst." },
            { "name" : "Goal",          "question": "[Goal] Enter the your goal: ",                    "answer": "",    ask: true, default: "I want to sending and withdrawing money by adults and non-adults." },
            { "name" : "Action",        "question": "[Action] What action do you want to perform: ",     "answer": "",  ask: true, default: "Write at least 3 test scenario." },
            { "name" : "Output",        "question": "[Output] What output do you want the results: ",    "answer": "",  ask: true, default: "Using BDD style." },
            { "name" : "Instruction",   "question": "[Instructions] What instructions do you want to give: ",    "answer": "Use the following {instruction} and {criteria}. {instruction}=1. Always start BDD style with 'Feature:' keyword. 2. Use 'Scenario Outline:' instead of 'Scenario:'. 3. Include steps in the Background if they are repeated at the beginning of all Scenario Outline in a Feature. 4. Background step should come before every Scenario Outline. 5. Tags are written with '@{descriptive-test}' {descriptive-test}=summary of the individual Feature or Scenario Outline. 6. Put tags at the line on top of only Feature and Scenario Outline and not Examples to annotate it. 7.  Include Examples for each Scenario Outline. 8.  Use '@test @dev' to annotate Examples. {criteria}=",  
            ask: false,
            default: "Use the following {instruction} and {criteria}. {instruction}=1. Always start BDD style with 'Feature:' keyword. 2. Use 'Scenario Outline:' instead of 'Scenario:'. 3. Include steps in the Background if they are repeated at the beginning of all Scenario Outline in a Feature. 4. Background step should come before every Scenario Outline. 5. Tags are written with '@{descriptive-test}' {descriptive-test}=summary of the individual Feature or Scenario Outline. 6. Put tags at the line on top of only Feature and Scenario Outline and not Examples to annotate it. 7.  Include Examples for each Scenario Outline. 8.  Use '@test @dev' to annotate Examples. 9. Add newline at the end. {criteria}=" },
            { "name" : "Context",       "question": "[Context] Insert context:  ",                        "answer": "", ask: true, default: "User should be an adult. User should be able to withdraw money if adult. User should be able to send money if adult. Block not adult users from sending more than 20 euros of money. Only adult user can send any amount of money." }
        ]
        prompt_chatGPT(client, prompts)
    }
}

main()
