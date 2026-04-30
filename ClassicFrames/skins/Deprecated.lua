function GetTexCoordsForRole(role)
	local textureHeight, textureWidth = 256, 256
	local roleHeight, roleWidth = 67, 67

	if ( role == "GUIDE" ) then
		return GetTexCoordsByGrid(1, 1, textureWidth, textureHeight, roleWidth, roleHeight)
	elseif ( role == "TANK" ) then
		return GetTexCoordsByGrid(1, 2, textureWidth, textureHeight, roleWidth, roleHeight)
	elseif ( role == "HEALER" ) then
		return GetTexCoordsByGrid(2, 1, textureWidth, textureHeight, roleWidth, roleHeight)
	elseif ( role == "DAMAGER" ) then
		return GetTexCoordsByGrid(2, 2, textureWidth, textureHeight, roleWidth, roleHeight)
	else
		error("Unknown role: "..tostring(role))
	end
end

function GetBackgroundTexCoordsForRole(role)
	local textureHeight, textureWidth = 128, 256
	local roleHeight, roleWidth = 75, 75

	if ( role == "TANK" ) then
		return GetTexCoordsByGrid(2, 1, textureWidth, textureHeight, roleWidth, roleHeight)
	elseif ( role == "HEALER" ) then
		return GetTexCoordsByGrid(1, 1, textureWidth, textureHeight, roleWidth, roleHeight)
	elseif ( role == "DAMAGER" ) then
		return GetTexCoordsByGrid(3, 1, textureWidth, textureHeight, roleWidth, roleHeight)
	else
		error("Role does not have background: "..tostring(role))
	end
end

function GetTexCoordsForRoleSmallCircle(role)
	if ( role == "TANK" ) then
		return 0, 19/64, 22/64, 41/64
	elseif ( role == "HEALER" ) then
		return 20/64, 39/64, 1/64, 20/64
	elseif ( role == "DAMAGER" ) then
		return 20/64, 39/64, 22/64, 41/64
	else
		error("Unknown role: "..tostring(role))
	end
end

function GetTexCoordsForRoleSmall(role)
	if ( role == "TANK" ) then
		return 0.5, 0.75, 0, 1
	elseif ( role == "HEALER" ) then
		return 0.75, 1, 0, 1
	elseif ( role == "DAMAGER" ) then
		return 0.25, 0.5, 0, 1
	else
		error("Unknown role: "..tostring(role))
	end
end