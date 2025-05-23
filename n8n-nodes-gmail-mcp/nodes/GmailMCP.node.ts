import { INodeType, INodeTypeDescription } from 'n8n-workflow';

export class GmailMCPNode implements INodeType {
  description: INodeTypeDescription = {
    displayName: 'Gmail MCP',
    name: 'gmailMcp',
    group: ['input'],
    version: 1,
    description: 'Node for accessing Gmail via MCP',
    defaults: {
      name: 'Gmail MCP',
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
        displayName: 'Email Subject',
        name: 'subject',
        type: 'string',
        default: '',
        placeholder: 'e.g. Invoice or Meeting',
        description: 'The subject of the email to search or send',
      },
      {
        displayName: 'Email Address',
        name: 'email',
        type: 'string',
        default: '',
        placeholder: 'e.g. someone@example.com',
        description: 'The email address of the sender or recipient',
      },
    ],
  };
}
