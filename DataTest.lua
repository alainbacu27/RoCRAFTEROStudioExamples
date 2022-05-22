local HttpService = game:GetService("HttpService")
game.Players.PlayerAdded:Connect(function(player)
	local playerUserId = "Player_" .. player.UserId
	local Data = {
		["PlayerID"] = playerUserId;
	}
	Data = HttpService:JSONEncode(Data)
	local success = pcall(function()
		print(HttpService:PostAsync("WebPage", Data))
	end)
	if not success then
		print("The Remote server could not be accessed.")
	else
		print("Sent "..playerUserId.." to Database")
	end
end)