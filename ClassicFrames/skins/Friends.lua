if not _G.FriendsFrame then return end

FriendsFrame.PortraitContainer.CircleMask:Hide()

FriendsFramePortrait:SetSize(61, 61)
FriendsFramePortrait:ClearAllPoints()
FriendsFramePortrait:SetPoint("TOPLEFT", -6, 8)

FriendsFramePortraitFrame:SetParent(FriendsFrame.PortraitContainer)
FriendsFramePortraitFrame:SetDrawLayer("OVERLAY", 1)

FriendsFrame.TitleContainer:ClearAllPoints()
FriendsFrame.TitleContainer:SetPoint("TOPLEFT", FriendsFrame, "TOPLEFT", 58, 0)
FriendsFrame.TitleContainer:SetPoint("TOPRIGHT", FriendsFrame, "TOPRIGHT", -58, 0)

FriendsFrameTab1:ClearAllPoints()
FriendsFrameTab1:SetPoint("BOTTOMLEFT", 5, -30)
FriendsFrameTab2:ClearAllPoints()
FriendsFrameTab2:SetPoint("LEFT", FriendsFrameTab1, "RIGHT", -15, 0)
FriendsFrameTab3:ClearAllPoints()
FriendsFrameTab3:SetPoint("LEFT", FriendsFrameTab2, "RIGHT", -15, 0)
FriendsFrameTab4:ClearAllPoints()
FriendsFrameTab4:SetPoint("LEFT", FriendsFrameTab3, "RIGHT", -15, 0)

hooksecurefunc("FriendsFrame_Update", function()
	if ( FriendsFrame.selectedTab == 1 ) then
		FriendsFrameIcon:SetTexture("Interface\\FriendsFrame\\Battlenet-Portrait")
	elseif ( FriendsFrame.selectedTab == 2 ) then
		FriendsFrameIcon:SetTexture("Interface\\FriendsFrame\\Battlenet-Portrait")
	elseif ( FriendsFrame.selectedTab == 3 ) then
		FriendsFrameIcon:SetTexture("Interface\\FriendsFrame\\Battlenet-Portrait")
	elseif ( FriendsFrame.selectedTab == 4 ) then
		FriendsFrameIcon:SetTexture("Interface\\LFGFrame\\UI-LFR-PORTRAIT")
	end
end)

ApplyDropDown(FriendsFrameStatusDropdown)
ApplyDropDown(WhoFrameDropdown)