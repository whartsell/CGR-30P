EDC33 = SimData:new()

function EDC33:anunciators()
	if self.data.rpm ~= nil then
		local rpm = self.data.rpm
		local rpm_anunciator = 0
		
		if ((2550 < rpm) and (rpm <2625)) then
			rpm_anunciator = 1
		
		elseif (rpm >= 2625) then
			rpm_anunciator = 2
		end
		self.data.rpmAnunciator = rpm_anunciator
	end
end






function EDC33Callback(rpm,map,cht,egt)
	local data = {}
	data.rpm = rpm
	data.map = map
	-- the random shouldnt be applied every update.  should be more intelligent
	data.cht1 = cht
	if cht > 0 then
		data.cht2 = math.random(-30,30) + cht
		data.cht3 = math.random(-30,30) + cht
		data.cht4 = math.random(-30,30) + cht
		data.cht5 = math.random(-30,30) + cht
		data.cht6 = math.random(-30,30) + cht
	else 
		data.cht2 = 0
		data.cht3 = 0
		data.cht4 = 0
		data.cht5 = 0
		data.cht6 = 0
	end
	data.egt1 = (egt - 491.67) *5/9 -- fsx provides rankine so we convert to celsius
		if egt > 0 then
		data.egt2 = math.random(-30,30) + data.egt1
		data.egt3 = math.random(-30,30) + data.egt1
		data.egt4 = math.random(-30,30) + data.egt1
		data.egt5 = math.random(-30,30) + data.egt1
		data.egt6 = math.random(-30,30) + data.egt1
	else 
		data.egt2 = 0
		data.egt3 = 0
		data.egt4 = 0
		data.egt5 = 0
		data.egt6 = 0
	end
	
	EDC33:Update(data)
	EDC33:anunciators()
end

fsx_variable_subscribe("GENERAL ENG RPM:1", "Rpm",
	"RECIP ENG MANIFOLD PRESSURE:1", "Psi",
	"RECIP ENG CYLINDER HEAD TEMPERATURE:1","Celsius",
	"GENERAL ENG EXHAUST GAS TEMPERATURE:1","Rankine",
	EDC33Callback)