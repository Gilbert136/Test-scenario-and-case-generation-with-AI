import { ChatOpenAI } from "@langchain/openai"
import { ChatPromptTemplate } from "@langchain/core/prompts"
//🟠 we need the this one to create local documents
import { Document } from "@langchain/core/documents"
import { createStuffDocumentsChain } from "langchain/chains/combine_documents"

const model = new ChatOpenAI({
    openAIApiKey: "sk-proj-OseJ7qGsiNk7IV9OIxIET3BlbkFJVGZ6NtHNRiFBgGFOoOkC", 
    //🟠 zero temperature, no extra creativity
    temperature: 0
})

//🟠 adding the extra context to the prompt
const prompt = ChatPromptTemplate.fromTemplate(
    `Answer the user's question from the following context: 
    {context}
    Question: {input}`
)

//🟠 manually create static documents
const documentA = new Document({
  pageContent:
    `LangChain is a framework that was designed to simplify 
the making of applications that integrate Large Language Models.
It does this in a modular, flexible and scalable architecture, 
easy to maintain. Langchain has Javascript and Python implmenations.`
})

const documentB = new Document({
  pageContent: `LangChain was first launched in October 2022.`
})

const chain = await createStuffDocumentsChain({
    llm: model,
    prompt
})

const question = `When was LangChain released and 
in what languages can I use it?` 

//🟠 pass the documents array as the context
const answer = await chain.invoke({
    input: question,
    context: [documentA, documentB]
})

console.log(answer)