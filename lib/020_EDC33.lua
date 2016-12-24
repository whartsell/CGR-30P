EDC33 = SimData:new()

function EDC33:anunciators()
	if self.data.rpm ~= nil then
		local rpm = self.data.rpm
		local rpm_anunciator = 0
		print ("rpm is " .. rpm)
		
		if ((2550 < rpm) and (rpm <2625)) then
			rpm_anunciator = 1
		
		elseif (rpm >= 2625) then
			rpm_anunciator = 2
		end
		self.data.rpmAnunciator = rpm_anunciator
	end
end






function EDC33Callback(rpm,map)
	local data = {}
	data.rpm = rpm
	data.map = map
	EDC33:Update(data)
	EDC33:anunciators()
end

fsx_variable_subscribe("GENERAL ENG RPM:1", "Rpm",
	"RECIP ENG MANIFOLD PRESSURE:1", "Psi",EDC33Callback)