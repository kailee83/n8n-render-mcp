import {
	ICredentialType,
	NodePropertyTypes,
} from 'n8n-workflow';

export class GoogleCalendarOAuth2Api implements ICredentialType {
	name = 'googleCalendarOAuth2Api';
	extends = ['oAuth2Api'];
	displayName = 'Google Calendar OAuth2 API';
	documentationUrl = 'https://developers.google.com/calendar';
	properties = [
		{
			displayName: 'Scope',
			name: 'scope',
			type: 'string' as NodePropertyTypes,
			default: 'https://www.googleapis.com/auth/calendar',
		},
	];
}

