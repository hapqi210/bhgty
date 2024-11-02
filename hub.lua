_G.AUTOHAKI = true
spawn(function()
	while wait(.1) do
		if _G.AUTOHAKI then 
			if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
				local args = {
					[1] = "Buso"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end
end)
LocalPlayer = game:GetService("Player").LocalPlayer
Char = LocalPlayer.Character
_G.AutoFarm = true
local GetQuests =function(N,NB)
      local args = {
    [1] = "StartQuest",
    [2] = N or "BanditQuest1",
    [3] = NB or 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end;local ChackQ = function()
    local Lv = LocalPlayer.Data.Level
     if Lv.Value >= 1 and Lv.Value <9 then
           retrun {
               ["Mon"] ='Bandit'
               ["NumQ"] = 'BanditQuest1'
               ["NameQ"] = '1'
               ["CFrameQ"] = CFrame.new(1232.51721, 14.9715757, 1539.78882, -0.984812498, 0, -0.173621133, 0, 1, 0, 0.173621133, 0, -0.984812498)
               ["CFrameMon"] = CFrame.new(1331.30493, 14.1810465, 1497.74548, -0.717166245, 0.387592793, 0.579175711, 0.140181527, 0.894316137, -0.424909145, -0.682657897, -0.223540723, -0.695706666)
             }
      elseif Lv.Value >= 10 and Lv.Value <= 9e99 then
             retrun {
             	 ["Mon"] = 'Money'
                 ["NumQ"] = 'JungleQuest'
                 ["NameQ"] = 1,
                 ["CFrameQ"] = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)      
                 ["CFrameMon] = CFrame.new(1619.10632, 21.7005882, 142.148117, 0.342042625, -0.000311157171, 0.939684391, 0.000113111477, 0.99999994, 0.000289957155, -0.939684391, 7.11137545e-06, 0.342042685)
                 }
            end
      end;
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoFarm then
                local UIQ = LocalPlayer.PlayerGui.Main.Quest
                ClearQ()
                if not UIQ.Visible or UIQ.Visible == false then
                    TW(ChackQ()["CFrameQ"])
                    if (ChackQ()["CFrameQ"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                        wait(.2)
                        GetQuests(ChackQ()["NumQ"],ChackQ()["NameQ"])
                    end
                else
                    if game:GetService("Workspace").Enemies:FindFirstChild(ChackQ()["Mon"]) then
                        for _i,_v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if _v.Name == tostring(ChackQ()["Mon"]) and _v:FindFirstChild("Humanoid") and _v:FindFirstChild("HumanoidRootPart") then
                                if _v.Humanoid.Health > 0 then
                                    repeat wait()
                                        TW(_v:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,0,5))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.AutoFarm or _G.AutoFarm == false or not _v.Parent or _v.Humanoid.Health <= 0 or not UIQ.Visible or UIQ.Visible == false
                                end
                            end
                        end
                    else
                        Char.HumanoidRootPart.CFrame = ChackQ()["CFrameMon"]
                    end
                end
            end
        end)
    end
end)