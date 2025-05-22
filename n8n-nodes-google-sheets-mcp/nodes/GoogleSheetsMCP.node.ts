import { INodeType, INodeTypeDescription } from 'n8n-workflow';

export class GoogleSheetsMCPNode implements INodeType {
  description: INodeTypeDescription = {
    displayName: 'Google Sheets MCP',
    name: 'googleSheetsMcp',
    group: ['input'],
    version: 1,
    description: 'Node for accessing Google Sheets via MCP',
    defaults: {
      name: 'Google Sheets MCP',
    },
    inputs: ['main'],
    outputs: ['main'],
    properties: [],
  };
}
