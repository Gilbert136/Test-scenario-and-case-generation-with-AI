import OpenAI from "openai";
import promptSync from 'prompt-sync';
import { writeFile, existsSync, mkdirSync } from 'fs';

const prompt = promptSync({sigint: true});
const model_name = "chat_gpt_35"
const timestamp = new Date().getTime()

function get_query(prompts) {
    prompts.forEach(x => {
        x.answer = prompt(x.question);
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
    const chat_completion = await client.chat.completions.create({
        messages: [
            {"role": "system", "content": prompts[0]["answer"]},
            {"role": "user", "content": query},
            //{"role":"assistant","content": few_shot_assistant_prompt},
            //{"role": "user", "content": user_message},
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
            { "name" : "Persona",   "question": "[Persona] Enter persona: ",                     "answer": "" },
            { "name" : "Goal",      "question": "[Goal] Enter the your goal: ",                    "answer": "" },
            { "name" : "Context",   "question": "[Context] Insert context:  ",                        "answer": "" },
            { "name" : "Action",    "question": "[Action] What action do you want to perform: ",     "answer": "" },
            { "name" : "Output",    "question": "[Output] What output do you want the results: ",    "answer": "" }
        ]
        prompt_chatGPT(client, prompts)
    }
}

main()
