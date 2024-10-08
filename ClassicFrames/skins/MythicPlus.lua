local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ChallengesUI" then
		hooksecurefunc(ChallengesFrame.WeeklyInfo.Child.WeeklyChest, "Update", function(self)
			self.AnimTexture:SetScale(1)
			self.Icon:SetScale(1)
			self.Highlight:SetScale(1)
			if (self.Icon:GetAtlas() == "gficon-chest-evergreen-greatvault-incomplete") then
				self.AnimTexture:SetAtlas("mythicplus-dragonflight-greatvault-incomplete", true)
				self.Icon:SetAtlas("mythicplus-dragonflight-greatvault-incomplete", true)
				self.Highlight:SetAtlas("mythicplus-dragonflight-greatvault-incomplete", true)
			elseif (self.Icon:GetAtlas() == "gficon-chest-evergreen-greatvault-complete") then
				self.AnimTexture:SetAtlas("mythicplus-dragonflight-greatvault-complete", true)
				self.Icon:SetAtlas("mythicplus-dragonflight-greatvault-complete", true)
				self.Highlight:SetAtlas("mythicplus-dragonflight-greatvault-complete", true)
			elseif (self.Icon:GetAtlas() == "gficon-chest-evergreen-greatvault-collect") then
				self.AnimTexture:SetAtlas("mythicplus-dragonflight-greatvault-collect", true)
				self.Icon:SetAtlas("mythicplus-dragonflight-greatvault-collect", true)
				self.Highlight:SetAtlas("mythicplus-dragonflight-greatvault-collect", true)
			end
		end)
	end
end)