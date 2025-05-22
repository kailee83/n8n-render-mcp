"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.GoogleSheetsMCPNode = void 0;
class GoogleSheetsMCPNode {
    constructor() {
        this.description = {
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
}
exports.GoogleSheetsMCPNode = GoogleSheetsMCPNode;
