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
    inputs: ['main'],
    outputs: ['main'],
    properties: [],
  };
}
