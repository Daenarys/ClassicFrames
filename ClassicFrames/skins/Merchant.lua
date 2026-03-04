if not _G.MerchantFrame then return end

ApplyDropDown(MerchantFrame.FilterDropdown)

MerchantFrame.FilterDropdown:SetWidth(147)
MerchantFrame.FilterDropdown:SetPoint("TOPRIGHT", -17, -29)
MerchantFrame.FilterDropdown.Text:SetJustifyH("RIGHT")
MerchantFrame.FilterDropdown.Text:SetPoint("TOPLEFT", 9, -8)