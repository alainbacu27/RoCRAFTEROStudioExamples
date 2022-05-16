function Request(Url, Method, Headers)
	local Options = {};
	Options.Url = Url;
	Options.Method = Method;
	Options.Headers = Headers;
	return ({pcall(function() return game.HttpService:RequestAsync(Options); end)})[2]; -- Literally just sends request
end;

for i = 1, 400, 1 do
	spawn(function() print(Request("http://rocrafteroprod1.x10host.com", "GET", {}).Body); end); -- Send much requests in the background
end
spawn(function() while wait(1) do print("1 SECOND"); end; end); -- Print that to separate the "packets"
print("ALL SENT!")