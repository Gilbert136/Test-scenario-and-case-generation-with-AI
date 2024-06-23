import { system_prompt_few_shot, assistant_prompt_few_shot, user_prompt_few_shot, prompt_action, prompt_output, user_goal, prompt_context, prompt_placeholder, prompt_output_reformat, prompt_output_regenerate } from './helpers/prompts.js'
import { chatGPT_client, save_file, get_query, prompt } from './helpers/methods.js'
import { model_name, open_api_key } from './helpers/constants.js'

async function prompt_chatGPT(client, prompts) {
    const messages = [{"role": "system", "content": prompts[0]["answer"]}]

    const timestamp = new Date().getTime()
    const model_technique = "few-shot-prompting"
    const file_name = `${model_technique}-${timestamp}.feature`  
    const directory_name = './features/'

    let query = ''
    let reply = ''
    let keep_generation = 'Y'
    while (keep_generation.toUpperCase() == 'Y') {
        let append_reply = false 
        if(query.length === 0) { 
            query = await get_query(prompts) 
            messages.push({"role": "user", "content": user_prompt_few_shot})
            messages.push({"role":"assistant","content": assistant_prompt_few_shot})
            messages.push({"role": "user", "content": query})
            console.log(`${query}`)

        } 
        else {
            query = await prompt(`Add more information or press enter to keep generating or press R to regenerate or Press r to reformat? `)
            if(query.trim().length === 0){
                query = `continue and add more scenarios`
                append_reply = true
            }else if(query.trim() === 'R'){
                query = prompt_output_regenerate
                append_reply = false
            } else if(query.trim() === 'r'){
                query = prompt_output_reformat
                append_reply = false
            }
            messages.push({"role": "user", "content": query })
        }

        let chat_completion = await client.chat.completions.create({ messages:messages, model: model_name })
        let chat_completion_response = chat_completion.choices[0].message.content.replaceAll("```gherkin", "").replaceAll("```", "")
        if(append_reply){
            reply += chat_completion_response
        }else{
            reply = chat_completion_response
        }
        console.log(reply)

        keep_generation = await prompt("Do you want to continue generating or reformat Y/N. Any response other than Y will close the application? ")
        if(keep_generation.toUpperCase() == 'Y') {
            messages.push({"role": "assistant", "content": reply})
        } else {
            keep_generation = 'N'
            console.log(reply)
            save_file(directory_name, file_name, reply)
        }
    } 
    console.log('Application closed.')
}

async function main() {
    const api_key = await prompt("Insert openai api key: ")
    const client = await chatGPT_client(api_key.trim().length == 0 ? open_api_key : api_key)
    if (client == null) {
        console.log("You can find your API key at https://platform.openai.com/api-keys ")
    } else {
        const prompts = [
            { "name" : "Persona",       "question": "[Persona] Enter persona: ",  "answer": "", ask: true, default: system_prompt_few_shot },
            { "name" : "Goal",          "question": "[Goal] Enter goal: ",        "answer": "",    ask: true, default: user_goal },
            { "name" : "Action",        "question": "[Action] Enter action: ",    "answer": "",  ask: false, default: prompt_action },
            { "name" : "Output",        "question": "[Output] Enter output: ",    "answer": "",  ask: false, default: prompt_output },
            { "name" : "placeholder",   "question": "prompt placeholder  ",       "answer": "", ask: false, default: prompt_placeholder },
            { "name" : "Context",       "question": "[Context] Enter context:  ", "answer": "", ask: true, default: prompt_context }
        ]
        prompt_chatGPT(client, prompts)
    }
}

main()