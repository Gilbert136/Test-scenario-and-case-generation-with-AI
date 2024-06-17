import { config } from "dotenv";
config();

import { OpenAIEmbeddings, ChatOpenAI } from "@langchain/openai";
import { DirectoryLoader } from "langchain/document_loaders/fs/directory";
import { TextLoader } from "langchain/document_loaders/fs/text";

import { RecursiveCharacterTextSplitter } from "langchain/text_splitter";
//import { MemoryVectorStore } from "langchain/vectorstores/memory";
import { FaissStore } from "@langchain/community/vectorstores/faiss";
import { MemoryVectorStore } from "langchain/vectorstores/memory";

import { RetrievalQAChain, loadQAStuffChain } from "langchain/chains";
import { ChatPromptTemplate, SystemMessagePromptTemplate, AIMessagePromptTemplate, HumanMessagePromptTemplate, } from "@langchain/core/prompts";
import { createStuffDocumentsChain } from "langchain/chains/combine_documents";
import { StringOutputParser } from "@langchain/core/output_parsers";


async function working() {
  const loader = new DirectoryLoader("./external_knowledge", {".txt": (path) => new TextLoader(path),});
const docs = await loader.load();

const splitter = new RecursiveCharacterTextSplitter({
  chunkSize: 200,
  chunkOverlap: 50,
});

const documents = await splitter.splitDocuments(docs);

const embeddings = new OpenAIEmbeddings({
    apiKey: "sk-proj-OseJ7qGsiNk7IV9OIxIET3BlbkFJVGZ6NtHNRiFBgGFOoOkC", // In Node.js defaults to process.env.OPENAI_API_KEY
    batchSize: 512, // Default value if omitted is 512. Max is 2048
    model: "text-embedding-3-large",
  });

const vectorstore = await FaissStore.fromDocuments(documents, embeddings);
await vectorstore.save("./index");

const vectorStoreIndex = await FaissStore.load("./index", embeddings);

const retriever = vectorStoreIndex.asRetriever();
const prompt = ChatPromptTemplate.fromTemplate(`Answer the user's question with this {context}. Question: {input}`);
const model = new ChatOpenAI({ model: "gpt-3.5-turbo", temperature: 0, apiKey: "sk-proj-OseJ7qGsiNk7IV9OIxIET3BlbkFJVGZ6NtHNRiFBgGFOoOkC" });

const combineDocsChain = await createStuffDocumentsChain({
  llm: model,
  prompt
});

const question = "who are the users that can login to the application."

const retrievedDocs = await retriever.invoke(question);

 const response = await combineDocsChain.invoke({
   input: question,
   context: retrievedDocs,
 });

  console.log(response);
}

async function search_for_relevant_criterials(question) {
  const loader = new DirectoryLoader("./external_knowledge", {".txt": (path) => new TextLoader(path),});
  const docs = await loader.load();
  
  const splitter = new RecursiveCharacterTextSplitter({
    chunkSize: 200,
    chunkOverlap: 50,
  });
  
  const documents = await splitter.splitDocuments(docs);
  
  const embeddings = new OpenAIEmbeddings({
      apiKey: "sk-proj-OseJ7qGsiNk7IV9OIxIET3BlbkFJVGZ6NtHNRiFBgGFOoOkC", // In Node.js defaults to process.env.OPENAI_API_KEY
      batchSize: 512, // Default value if omitted is 512. Max is 2048
      model: "text-embedding-3-large",
    });
  
  const vectorstore = await FaissStore.fromDocuments(documents, embeddings);
  await vectorstore.save("./index");
  
  const vectorStoreIndex = await FaissStore.load("./index", embeddings);
  
  const retriever = vectorStoreIndex.asRetriever();

  const retrievedDocs = await retriever.invoke(question);

  const prompt = ChatPromptTemplate.fromTemplate(
  `
  Generate acceptance criteria for this user story: {input} 
  Using the information below as context: 
  {context}.
  Do not number or bullet the results
  `);
  const model = new ChatOpenAI({ model: "gpt-3.5-turbo", temperature: 0, apiKey: "sk-proj-OseJ7qGsiNk7IV9OIxIET3BlbkFJVGZ6NtHNRiFBgGFOoOkC" });
  
  const combineDocsChain = await createStuffDocumentsChain({
    llm: model,
    prompt
  });
    
   const response = await combineDocsChain.invoke({
     input: question,
     context: retrievedDocs,
   });
  
    console.log(response);
}

async function langchain_prompt() {
  const system_prompt = 
  `
  You are a Quality assurance engineer. You are an expect in writing test scenarios with test cases in BDD Gherkin style. 
  You always take into consideration all edge cases and includes both positive and negative scenarios. 
  You always write test scenarios with test cases and include detail examples for each. 
  You always follow a set of instructions to create test scenarios with test cases. 
  You always follow the instructions below: 
  {instructions}.  
  `;

  const system_prompt_instruction =  `  
  1. Always start BDD Gherkin style with 'Feature:' keyword. 
  2. Use 'Scenario Outline:' instead of 'Scenario:'. 
  3. Include steps in the Background if they are repeated at the beginning of all Scenario Outline in a Feature. 
  4. Background step should come before every Scenario Outline. 
  5. Tags are written with '@{descriptive-test}' {descriptive-test}=summary of the individual Feature or Scenario Outline. 
  6. Put tags at the line on top of only Feature and Scenario Outline and not Examples to annotate it. 
  7. Include Examples for each Scenario Outline. 8.  Use '@test @dev' to annotate Examples. 9. Include comments
`

const user_goal = 
`
I want to sending and withdrawing money by adults and non-adults, so that I can be able to make transactions for my business.
`;

const user_goal2 = 
`
I want to be able to create an accunt, so that I can create my own profile.
`;

const user_prompt = 
  `
  I want to login to my bank account, so that I can be able to check my bank account balance.
  Write at least six positive and negative test scenarios with cases. Using BDD Gherkin style. 
  Follow these below criterias: 
  I should be able to login into bank account if username and password are correct.       
  I can not log into bank account if username and password are not correct.     
  I should  view bank balance if the user is login and have permission to view account balance.        
  I should not view account balance if they are login and do not have permission to view account balance."  
  `;

  const user_prompt_2 = 
  `
  {goal}
  Write at least six positive and negative test scenarios with cases. Using BDD Gherkin style. 
  Follow these below criterias: 
  {criterias}
  `;

  const user_prompt_criterias = 
  `
  User should be an adult. User should be able to withdraw money if adult. 
  I should be able to send money if adult. 
  I should not be able to send more than 20 euros of money if not adult. 
  I should be able to send any amount of money if I am only an adult.
  `;

  const user_prompt_criterias2 = 
  `
  I should be able to create an account if I do not have an exist account.    
  I should be able to create a profile if I have an account.       
  I should not be able to create a profile if I do not have an account.        
  I should not be able to create a profile if I do not remember my account username and password.
  `;

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
  const question = "I want to login to my bank account, so that I can be able to check my bank account balance."

  const system_message_prompt = SystemMessagePromptTemplate.fromTemplate(system_prompt);

  const human_message_prompt = HumanMessagePromptTemplate.fromTemplate(user_prompt);

  const ai_message_prompt = AIMessagePromptTemplate.fromTemplate(few_shot_prompt_with_assistant);

  const human_message_prompt_2 = HumanMessagePromptTemplate.fromTemplate(user_prompt_2);


  const chatPrompt = ChatPromptTemplate.fromMessages([system_message_prompt, human_message_prompt, ai_message_prompt, human_message_prompt_2]);

  const formattedChatPrompt = await chatPrompt.invoke({
    instructions: system_prompt_instruction,
    goal: question,
    criterias: await search_for_relevant_criterials(question)
  });
  
  return formattedChatPrompt
}

async function generate_result() {
  const model = new ChatOpenAI({ model: "gpt-3.5-turbo", temperature: 0, apiKey: "sk-proj-OseJ7qGsiNk7IV9OIxIET3BlbkFJVGZ6NtHNRiFBgGFOoOkC" });
  const prompt = await langchain_prompt()
  
  const result = await model.invoke(prompt);

  
//  const combineDocsChain = await createStuffDocumentsChain({
  //  llm: model,
 //   prompt: prompt
//  });

  //const response = await combineDocsChain.invoke({});

  console.log(result.content)
} 

//await langchain_prompt()
await generate_result()

const question = "I want to login to my bank account, so that I can be able to check my bank account balance."
//await search_for_relevant_criterials(question)
