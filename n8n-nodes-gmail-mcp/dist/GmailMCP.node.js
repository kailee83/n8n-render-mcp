"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.GmailMCPNode = void 0;
class GmailMCPNode {
    constructor() {
        this.description = {
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
}
exports.GmailMCPNode = GmailMCPNode;
