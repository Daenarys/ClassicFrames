if not _G.PingSystemTutorial then return end

ApplyCloseButton(PingSystemTutorial.CloseButton)

PingSystemTutorial.TitleContainer:ClearAllPoints()
PingSystemTutorial.TitleContainer:SetPoint("TOPLEFT", PingSystemTutorial, "TOPLEFT", 58, 0)
PingSystemTutorial.TitleContainer:SetPoint("TOPRIGHT", PingSystemTutorial, "TOPRIGHT", -58, 0)

ApplyTitleBgNoPortrait(PingSystemTutorial)
ApplyNineSliceNoPortrait(PingSystemTutorial)