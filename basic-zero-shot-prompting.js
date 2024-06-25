import OpenAI from "openai";
import { writeFile, existsSync, mkdirSync } from 'fs';
import { system_prompt_zero_shot, prompt_action, prompt_output, user_goal, prompt_output_reformat, prompt_output_regenerate } from './helpers/prompts.js'
import { prompt, get_query } from './helpers/methods.js'
import { model_name, open_api_key } from './helpers/constants.js'

const timestamp = new Date().getTime()

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
    let api_key = await prompt("Insert openai api key: ")
    api_key = api_key.trim().length == 0 ? open_api_key : api_key
    const client = new OpenAI({ apiKey: api_key });
    return await check_chatGPT_api_key_validity(client) ? client : null
}

async function prompt_chatGPT(client, prompts) {
    const query = await get_query(prompts)
    const chat_completion = await client.chat.completions.create({
        messages: [
            {"role": "system", "content": prompts[0]["answer"]},
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
            { "name" : "Persona",       "question": "[Persona] Enter persona: ",                     "answer": "",      ask: true, default: system_prompt_zero_shot },
            { "name" : "Goal",          "question": "[Goal] Enter the your goal: ",                    "answer": "",    ask: true, default: user_goal },
            { "name" : "Action",        "question": "[Action] What action do you want to perform: ",     "answer": "",  ask: true, default: prompt_action },
            { "name" : "Output",        "question": "[Output] What output do you want the results: ",    "answer": "",  ask: true, default: prompt_output }
        ]
        prompt_chatGPT(client, prompts)
    }
}

main()
