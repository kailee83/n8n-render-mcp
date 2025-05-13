import {
	IExecuteFunctions,
} from 'n8n-core';

import {
	INodeExecutionData,
	INodeType,
	INodeTypeDescription,
} from 'n8n-workflow';

import { google } from 'googleapis';

export class GoogleCalendar implements INodeType {
	description: INodeTypeDescription = {
		displayName: 'Google Calendar',
		name: 'googleCalendar',
		icon: 'fa:calendar',
		group: ['output'],
		version: 1,
		description: 'Interact with the Google Calendar API',
		defaults: {
			name: 'Google Calendar',
		},
		credentials: [
			{
				name: 'googleCalendarOAuth2Api',
				required: true,
			},
		],
		inputs: ['main'],
		outputs: ['main'],
		properties: [
			{
				displayName: 'Return',
				name: 'return',
				type: 'options',
				options: [
					{
						name: 'Calendar List',
						value: 'calendarList',
						description: 'Get the list of calendars for the user',
					},
				],
				default: 'calendarList',
				description: 'Select what to return',
			},
		],
	};

	async execute(this: IExecuteFunctions): Promise<INodeExecutionData[][]> {
		const items = this.getInputData();
		const returnData: INodeExecutionData[] = [];

		const credentials = await this.getCredentials('googleCalendarOAuth2Api');

		const oauth2Client = new google.auth.OAuth2();
		oauth2Client.setCredentials({
			access_token: credentials.access_token,
			refresh_token: credentials.refresh_token,
			scope: credentials.scope,
			token_type: 'Bearer',
			expiry_date: credentials.expires,
		});

		const calendar = google.calendar({ version: 'v3', auth: oauth2Client });

		for (let i = 0; i < items.length; i++) {
			const operation = this.getNodeParameter('return', i) as string;

			if (operation === 'calendarList') {
				const response = await calendar.calendarList.list();
				returnData.push({
					json: response.data,
				});
			}
		}

		return [returnData];
	}
}
