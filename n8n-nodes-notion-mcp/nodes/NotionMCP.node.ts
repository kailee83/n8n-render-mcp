import { INodeType, INodeTypeDescription } from 'n8n-workflow';

export class NotionMCP implements INodeType {
  description: INodeTypeDescription = {
    displayName: 'Notion MCP',
    name: 'notionMcp',
    group: ['input'],
    version: 1,
    description: 'Node for interacting with Notion via MCP',
    defaults: {
      name: 'Notion MCP',
    },
   
inputs: [
    {
        id: 'main',          
        displayName: 'Main', 
       
    },
],
outputs: [
    {
        id: 'main',
        displayName: 'Main',
      
    },
],
    properties: [
      {
        displayName: 'Database ID',
        name: 'databaseId',
        type: 'string',
        default: '',
        placeholder: 'e.g. abcd1234efgh5678ijkl9012mnop3456',
        description: 'The ID of the Notion database',
      },
      {
        displayName: 'Query Text',
        name: 'query',
        type: 'string',
        default: '',
        placeholder: 'e.g. status = "Done"',
        description: 'The query to run on the Notion database',
      },
    ],
  };
}
