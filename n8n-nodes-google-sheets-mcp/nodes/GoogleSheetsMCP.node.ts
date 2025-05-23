import { INodeType, INodeTypeDescription } from 'n8n-workflow';

export class GoogleSheetsMCP implements INodeType {
  description: INodeTypeDescription = {
    displayName: 'Google Sheets MCP',
    name: 'googleSheetsMcp',
    group: ['input'],
    version: 1,
    description: 'Node for interacting with Google Sheets via MCP',
    defaults: {
      name: 'Google Sheets MCP',
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
        displayName: 'Spreadsheet ID',
        name: 'spreadsheetId',
        type: 'string',
        default: '',
        placeholder: 'e.g. 1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms',
        description: 'The ID of the Google Spreadsheet',
      },
      {
        displayName: 'Sheet Name',
        name: 'sheetName',
        type: 'string',
        default: '',
        placeholder: 'Sheet1',
        description: 'The name of the sheet to access',
      },
    ],
  };
}
