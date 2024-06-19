import { system_prompt_zero_shot, prompt_action, prompt_output, user_goal, prompt_context, prompt_placeholder } from './helpers/prompts.js'
import { chatGPT_client, save_file, get_query, prompt } from './helpers/methods.js'
import { model_name } from './helpers/constants.js'

async function prompt_chatGPT(client, prompts) {
    const query = get_query(prompts)
    console.log(query)

    const chat_completion = await client.chat.completions.create({
        messages: [
            {"role": "system", "content": prompts[0]["answer"]},
            {"role": "user", "content": query},
        ],
        model: model_name,
      });

      const timestamp = new Date().getTime()
      const model_technique = "zero-shot-prompting"
      const file_name = `${model_technique}_${timestamp}.feature`  
      const directory_name = './features/'  

      const reply = chat_completion.choices[0].message.content
            .replace("```gherkin", "")
            .replace("```", "")

      console.log(reply)
      save_file(directory_name, file_name, reply)

}

async function main() {
    const api_key = prompt.hide("Insert openai api key: ")
    const client = await chatGPT_client(api_key.trim().length == 0 ? 'sk-proj-OseJ7qGsiNk7IV9OIxIET3BlbkFJVGZ6NtHNRiFBgGFOoOkC' : api_key)
    if (client == null) {
        console.log("You can find your API key at https://platform.openai.com/api-keys ")
    } else {
        const prompts = [
            { "name" : "Persona",       "question": "[Persona] Enter persona: ",  "answer": "",      ask: true, default: system_prompt_zero_shot },
            { "name" : "Goal",          "question": "[Goal] Enter goal: ",        "answer": "",    ask: true, default: user_goal },
            { "name" : "Action",        "question": "[Action] Enter action: ",    "answer": "",  ask: true, default: prompt_action },
            { "name" : "Output",        "question": "[Output] Enter output: ",    "answer": "",  ask: true, default: prompt_output },
            { "name" : "placeholder",   "question": "prompt placeholder  ",       "answer": "", ask: false, default: '' },
            { "name" : "Context",       "question": "[Context] Enter context:  ", "answer": "", ask: false, default: '' }
        ]
        prompt_chatGPT(client, prompts)
    }
}

main()