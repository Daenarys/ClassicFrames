if not _G.NamePlatesTutorial then return end

ApplyCloseButton(NamePlatesTutorialCloseButton)

NamePlatesTutorial.TitleContainer:ClearAllPoints()
NamePlatesTutorial.TitleContainer:SetPoint("TOPLEFT", NamePlatesTutorial, "TOPLEFT", 58, 0)
NamePlatesTutorial.TitleContainer:SetPoint("TOPRIGHT", NamePlatesTutorial, "TOPRIGHT", -58, 0)

select(3, NamePlatesTutorial:GetRegions()):SetDrawLayer("BACKGROUND", -1)

ApplyTitleBgNoPortrait(NamePlatesTutorial)
ApplyNineSliceNoPortrait(NamePlatesTutorial)