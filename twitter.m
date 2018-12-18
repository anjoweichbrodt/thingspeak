% add timestamp to data in order to bypass twitters 'no duplicates' policy

% TODO - Replace the [] with channel ID to read data from:
readChannelID = [YOUR_CHANNEL_ID];
% TODO - Enter the Read API Key between the '' below:
readAPIKey = 'YOUR_READ_KEY';

%% Read Data for field 1 of given channel %%
data = thingSpeakRead(readChannelID, 'ReadKey', readAPIKey, 'Fields',1);
%% uncomment below to debug data
% disp(data)
thingTweetURL = 'https://api.thingspeak.com/apps/thingtweet/1/statuses/update';
thingTweetApiKey = 'YOUR_THINGTWEET_KEY';
fieldName = 'status';
fmtstr='Sensor reading %0.1f at %s';
fieldValue = sprintf(fmtstr,data,datestr(datetime('now')));
response = webwrite(thingTweetURL,'api_key',thingTweetApiKey,fieldName,fieldValue) 
