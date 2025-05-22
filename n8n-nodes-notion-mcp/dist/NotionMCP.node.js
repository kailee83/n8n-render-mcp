"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.NotionMCPNode = void 0;
class NotionMCPNode {
    constructor() {
        this.description = {
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
}
exports.NotionMCPNode = NotionMCPNode;
