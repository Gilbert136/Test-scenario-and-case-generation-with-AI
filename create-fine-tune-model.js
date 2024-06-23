import OpenAI from "openai";
import { createReadStream } from 'fs';
import { assistant_prompt_few_shot, prompt_criterias, system_prompt_few_shot, user_prompt_few_shot } from './helpers/prompts.js'
import { save_file, convert_json_jsonL, prompt } from './helpers/methods.js'
import { model_name, open_api_key } from './helpers/constants.js'

async function generate_results(api_key) {
    const client = new OpenAI({ apiKey: api_key });

    let json_result = await Promise.all(prompt_criterias.map(async (criteria) => {
        const chat_completion = await client.chat.completions.create({
            messages: [
                {"role": "system", "content": system_prompt_few_shot},
                {"role": "user", "content": user_prompt_few_shot},
                {"role":"assistant","content": assistant_prompt_few_shot},
                {"role": "user", "content": criteria},
            ],
            model: model_name,
        });
        let fine_tuning_data = {
            "messages": [
                {
                    "role": "system",
                    "content": system_prompt_few_shot
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

    const timestamp = new Date().getTime()
    const directory_name = './training_data/' 
    const file_name = `fine-tuning-data-${timestamp}`
    const file_name_json = `${file_name}.json`
    const path = `${directory_name}${file_name}`

    save_file(directory_name, file_name_json, JSON.stringify(json_result, null, 2), convert_json_jsonL)
    convert_json_jsonL(path)
    return path
}

async function upload_jsonl_to_openai(api_key, path){
    const client = new OpenAI({ apiKey: api_key });
    const response = await client.files.create({ 
        file: createReadStream(`${path}.jsonl`), 
        purpose: 'fine-tune' });
    const file_id = response['id']
    console.log(`File was successfully uploaded with id ${file_id}`)
    return file_id
}

async function create_fine_tuning_job(api_key, file_id){
    const client = new OpenAI({ apiKey: api_key });
    const response = await client.fineTuning.jobs.create({   
        model: model_name,
        training_file: file_id})
    const job_id = response['id']
    console.log(`Fine-tuning job was successfully created with id ${job_id}. Check ChatGPT fine-tuning playground dashboard to see progress`)
}

async function create_fine_tune_model() {
    const path = await generate_results(open_api_key)
    const upload_to_openai = await prompt("Do you want to upload training data to openai to create fine-tune-model Y/N? ")
    if(upload_to_openai.toUpperCase() == 'Y') {
        const file_id = await upload_jsonl_to_openai(open_api_key, path)
        await create_fine_tuning_job(open_api_key, file_id);
    }

    //await generate_results(`sk-proj-EVPqFWANWV22tYV6yU5KT3BlbkFJdHqcWu3OhheEAlGfPRLS`)
    //await upload_jsonl_to_openai(`sk-proj-EVPqFWANWV22tYV6yU5KT3BlbkFJdHqcWu3OhheEAlGfPRLS`, path)
    //await create_fine_tuning_job(open_api_key, `file-zZ82HN84LTmXlXhWBX92R0oa`);
}

await create_fine_tune_model()
