import { Configuration, OpenAIApi } from "openai";

const configuration = new Configuration({
  apiKey: process.env.OPENAI_API_KEY,
});

const openai_client = new OpenAIApi(configuration);

const chat_completion = await openai_client.chat.completions.create({
    messages: [
        {"role": "system", "content": prompts[0]["answer"]},
        {"role": "user", "content": query},
        //{"role":"assistant","content": few_shot_assistant_prompt},
        //{"role": "user", "content": user_message},
    ],
    model: "gpt-3.5-turbo",
    temperature: 0
  });


  