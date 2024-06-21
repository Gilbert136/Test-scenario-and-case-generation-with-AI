import OpenAI from "openai";
import { writeFile, existsSync, mkdirSync } from 'fs';
import prompts from 'prompts'

import promptSync from 'prompt-sync';
import psp from 'prompt-sync-plus';

export const prompt = promptSync({sigint: true});

async function check_chatGPT_api_key_validity(client) {
    try {
        await client.models.list()
        return true
    } catch (error) {
        console.log(`OpenAI STATUS error ${error.code}`)
        return false
    }
}

export async function chatGPT_client(api_key) {
    const client = new OpenAI({ apiKey: api_key });
    return await check_chatGPT_api_key_validity(client) ? client : null
}

export function save_file(directory_name, file_name, content) {
    if (!existsSync(directory_name)){
        mkdirSync(directory_name, { recursive: true });
    }

    const path = directory_name + file_name
    writeFile(path, content, (err) => {
        if (err) throw err;
        console.log(`The file has been saved in the ${directory_name} directory!`);
    });
}

export async function get_query(prompts) {
    prompts.forEach(x => {
        if(x.ask) x.answer = prompt(x.question)
        if(x.answer.trim().length === 0)  x.answer = x.default.trim()+" "
    });
    return prompts.splice(1).reduce((full, first) => {
        return full+(first.answer.trim()+". ")}, "")
            .replaceAll("..", ".").replaceAll(" .", "")
}

export async function prompt(message, name) {
    const response = await prompts({
        type: 'text',
        name: name,
        message: message
      });
    return response[name]
}


(async () => {
    const response = await prompts({
      type: 'text',
      name: 'meaning',
      message: 'What is the meaning of life?'
    });
  
    console.log(response.meaning);
  })();