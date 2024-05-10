if not _G.PingSystemTutorial then return end

ApplyCloseButton(PingSystemTutorial.CloseButton)

PingSystemTutorial.TitleContainer:ClearAllPoints()
PingSystemTutorial.TitleContainer:SetPoint("TOPLEFT", PingSystemTutorial, "TOPLEFT", 58, 0)
PingSystemTutorial.TitleContainer:SetPoint("TOPRIGHT", PingSystemTutorial, "TOPRIGHT", -58, 0)

PingSystemTutorialBg:ClearAllPoints()
PingSystemTutorialBg:SetPoint("TOPLEFT", 3, -20)
PingSystemTutorialBg:SetPoint("BOTTOMRIGHT", -2, 2)

ApplyTitleBg(PingSystemTutorial)
ApplyNineSliceNoPortrait(PingSystemTutorial)