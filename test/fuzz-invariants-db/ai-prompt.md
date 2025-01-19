Analyze the fuzzing and invariant tests in this project and generate a structured Markdown document with the following details:

Project Name as the Title: Start the document with the name of the project as the main title.

Logical Sections: Organize the invariants by logical topics or areas. For example, if fuzzing relates to "Vaults," create a section specifically for "Vaults." Similarly, group invariants for other areas under their respective sections.

List of Invariants: For each logical section, list all relevant invariants to be tested. Clearly explain the purpose of each invariant and why it is necessary in the given context. Provide concise descriptions for better understanding.

Ghost Variables: If the fuzzing or invariant tests involve ghost variables:

Specify the ghost variables related to each logical section.
Explain their role in verifying the invariants within that section.
Provide suggestions on how to test these ghost variables effectively.
Improvement Suggestions (if applicable): If there are missing invariants or additional ghost variables that should be considered for a section, include them as recommendations.

Example:
```
# Project Name

## Logical Section 1: Vaults
- **Invariant 1:** Description of the invariant and its significance.
- **Invariant 2:** Description of the invariant and its significance.
- **Ghost Variables:** 
  - `VariableName`: Explanation of its role and how to test it.

## Logical Section 2: [Other Topic]
- **Invariant 1:** Description of the invariant and its significance.
- **Invariant 2:** Description of the invariant and its significance.
- **Ghost Variables:** 
  - `VariableName`: Explanation of its role and how to test it.

```
Focus on being as comprehensive and structured as possible. Ensure all relevant invariants and ghost variables are accounted for, and provide actionable insights for improving the testing process where necessary.
