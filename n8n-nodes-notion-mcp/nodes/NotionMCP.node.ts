import { INodeType, INodeTypeDescription } from 'n8n-workflow';

export class NotionMCPNode implements INodeType {
  description: INodeTypeDescription = {
    displayName: 'Notion MCP',
    name: 'notionMcp',
    group: ['input'],
    version: 1,
    description: 'Node for accessing Notion via MCP',
    defaults: {
      name: 'Notion MCP',
    },
    inputs: ['main'],
    outputs: ['main'],
    properties: [],
  };
}
