# Project abstract

The rapid advancement of Artificial Intelligence has presented significant opportunities for enhancing various domains, including software testing. This thesis explores the application of AI, specifically the GPT-3.5-turbo model, in the generation of test scenarios and test cases. By leveraging prompt engineering, fine-tuning, and retrieval-augmented generation, we aim to automate and improve the efficiency of software testing processes. Prompt engineering involves designing effective prompts to elicit high-quality outputs from the AI model. Fine-tuning adapts the model to the specific domain of software testing by training it on relevant datasets, thereby enhancing its performance. Retrieval-augmented generation integrates external knowledge sources to provide the AI model with additional context, improving the relevance and accuracy of the generated test cases. Through comprehensive experiments and evaluations, this thesis demonstrates the potential of GPT-3.5-turbo to revolutionize software testing by reducing manual effort, increasing coverage, and improving the overall quality of software products. The findings contribute to the broader understanding of AI's role in software engineering and offer practical insights for integrating AI-driven solutions in real-world testing environments.

# Node.js Project Setup

## Introduction

This README file provides instructions on how to set up and install necessary packages for a Node.js project. Following these steps will ensure that you have all the dependencies needed to run the project successfully.

## Prerequisites

Before starting, make sure you have the following software installed on your system:

1. **Node.js**: Download and install the latest version from [Node.js official website](https://nodejs.org/).
2. **npm**: Node Package Manager, which is included with Node.js. Verify the installation by running:
   node -v
   npm -v

## Project Setup
1. **Install Dependencies**: Once you have navigated to the project directory, install the required packages using npm. This will read the package.json file and install all listed dependencies.
   npm install
1. **Install global dependancy**: This is used for checking the linting errors.
   npm install gherkin-lint -g
2. **Run the Project**: After installing all dependencies and setting up environment variables, you can start the project. Typically, this is done using the following command based on which functionality you want use:
   npm run basic-zero-shot-prompting
   npm run zero-shot-prompting
   npm run few-shot-prompting
   npm run few-shot-prompting-with-fine-tuned
   npm run few-shot-prompting-with-rag
3. **Validate the results**: After running the project, you can validate the response for check for linting errors:
   npm run gherkin-lint
