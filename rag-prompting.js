import { OpenAIEmbeddings, ChatOpenAI } from "@langchain/openai";
import { DirectoryLoader } from "langchain/document_loaders/fs/directory";
import { TextLoader } from "langchain/document_loaders/fs/text";
import { RecursiveCharacterTextSplitter } from "langchain/text_splitter";
import { FaissStore } from "@langchain/community/vectorstores/faiss";
import { ChatPromptTemplate, SystemMessagePromptTemplate, AIMessagePromptTemplate, HumanMessagePromptTemplate, } from "@langchain/core/prompts";
import { createStuffDocumentsChain } from "langchain/chains/combine_documents";
import { system_prompt_zero_shot, system_prompt_few_shot, system_prompt_few_shot_rag, user_prompt_rag, retrieval_prompt_rag, system_prompt_few_shot_instruction, assistant_prompt_few_shot, user_prompt_few_shot, prompt_action, prompt_output, user_goal, prompt_context, prompt_placeholder, prompt_output_reformat, prompt_output_regenerate } from './helpers/prompts.js'
import { model_name, open_api_key } from './helpers/constants.js'
import { prompt } from './helpers/methods.js'


async function working() {
    const loader = new DirectoryLoader("./external_knowledge", {".txt": (path) => new TextLoader(path),});
    const docs = await loader.load();
    const splitter = new RecursiveCharacterTextSplitter({ chunkSize: 200, chunkOverlap: 50 });
    const documents = await splitter.splitDocuments(docs);  
    const embeddings = new OpenAIEmbeddings({
        apiKey: open_api_key,
        batchSize: 512,
        model: "text-embedding-3-large",
    });

    const vectorstore = await FaissStore.fromDocuments(documents, embeddings);
    await vectorstore.save("./index");
    
    const vectorStoreIndex = await FaissStore.load("./index", embeddings);
    const retriever = vectorStoreIndex.asRetriever();
    const prompt = ChatPromptTemplate.fromTemplate(`Answer the user's question with this {context}. Question: {input}`);
    const model = new ChatOpenAI({ model: model_name, temperature: 0, apiKey: open_api_key });
    const combineDocsChain = await createStuffDocumentsChain({ llm: model, prompt });

    const question = "who are the users that can login to the application."
    const retrievedDocs = await retriever.invoke(question);
    const response = await combineDocsChain.invoke({ input: question, context: retrievedDocs });
    console.log(response);
}

async function store_index(){
    const loader = new DirectoryLoader("./external_knowledge", {".txt": (path) => new TextLoader(path),});
    const docs = await loader.load();
    const splitter = new RecursiveCharacterTextSplitter({ chunkSize: 200, chunkOverlap: 50 });
    const documents = await splitter.splitDocuments(docs);
    const embeddings = new OpenAIEmbeddings({ apiKey: open_api_key, batchSize: 512, model: "text-embedding-3-large" });
    const vectorstore = await FaissStore.fromDocuments(documents, embeddings);
    await vectorstore.save("./index");
}

async function search_for_relevant_context(question) {
    await store_index()

    const embeddings = new OpenAIEmbeddings({ apiKey: open_api_key, batchSize: 512, model: "text-embedding-3-large" });
    const vectorStoreIndex = await FaissStore.load("./index", embeddings);
    const retriever = vectorStoreIndex.asRetriever();
    const retrievedDocs = await retriever.invoke(question);
    const prompt = ChatPromptTemplate.fromTemplate(retrieval_prompt_rag);
    const model = new ChatOpenAI({ model: model_name, temperature: 0, apiKey: open_api_key });
    const combineDocsChain = await createStuffDocumentsChain({ llm: model, prompt });
    const response = await combineDocsChain.invoke({ input: question, context: retrievedDocs })
    console.log(response.replaceAll('- ', '').replaceAll('.', '. '));
    return response.replaceAll('- ', '').replaceAll('.', '. ')
}

async function formulate_prompt_query(question) {
    const system_message_prompt = SystemMessagePromptTemplate.fromTemplate(system_prompt_few_shot_rag);
    const human_message_prompt = HumanMessagePromptTemplate.fromTemplate(user_prompt_few_shot);
    const ai_message_prompt = AIMessagePromptTemplate.fromTemplate(assistant_prompt_few_shot);
    const human_message_prompt_query = HumanMessagePromptTemplate.fromTemplate(user_prompt_rag);
    const chatPrompt = ChatPromptTemplate.fromMessages([system_message_prompt, human_message_prompt, ai_message_prompt, human_message_prompt_query]);

    const formattedChatPrompt = await chatPrompt.invoke({
        instructions: system_prompt_few_shot_instruction,
        goal: question,
        criterias: await search_for_relevant_context(question)
    });
    return formattedChatPrompt
}

async function generate_result() {
    let question = await prompt("[User story] Insert user story? ")
    question = question.trim().length === 0 ? "I want to login to my bank account, so that I can be able to check my bank account balance." : question
    const model = new ChatOpenAI({ model: model_name, temperature: 0, apiKey: open_api_key });
    const prompt_result = await formulate_prompt_query(question)
    const result = await model.invoke(prompt_result);
    console.log(result.content)
} 

await generate_result()