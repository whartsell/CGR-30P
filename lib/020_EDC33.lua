EDC33 = {}


function EDC33.new()
	local self = SimData.new()
	local scan_rate = 5000
	self.current_cylinder = 0
	self.cyl = {}
	self.cyl[1] = {offset = 0}
	self.cyl[2] = {offset = math.random(-30,30)}
	self.cyl[3] = {offset = math.random(-30,30)}
	self.cyl[4] = {offset = math.random(-30,30)}
	self.cyl[5] = {offset = math.random(-30,30)}
	self.cyl[6] = {offset = math.random(-30,30)}

	function self.anunciators()
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

	local function scanCylinder()
		self.current_cylinder = (self.current_cylinder % 6) + 1
		--print("refreshScan done")
	end
	
	local timers = {
		cylinderScan = timer_start(0,scan_rate,scanCylinder),
	}
	
	return self
end




Edc33 = EDC33.new()



function EDC33Callback(rpm,map,cht,egt)
	local data = {}
	data.rpm = rpm
	data.map = map
	-- the random shouldnt be applied every update.  should be more intelligent
	
	for i = 1,6 do
		if cht > 0 then
			Edc33.cyl[i].cht = Edc33.cyl[i].offset + cht -- in celsius
		else 
			Edc33.cyl[i].cht = 0
		end
		if egt > 0 then
			Edc33.cyl[i].egt = Edc33.cyl[i].offset + (egt - 491.67) *5/9 -- fsx provides rankine so we convert to celsius
		else 
			Edc33.cyl[i].egt = 0
		end
	end	
	Edc33.Update(data)
	Edc33.anunciators()
end

fsx_variable_subscribe("GENERAL ENG RPM:1", "Rpm",
	"RECIP ENG MANIFOLD PRESSURE:1", "Psi",
	"RECIP ENG CYLINDER HEAD TEMPERATURE:1","Celsius",
	"GENERAL ENG EXHAUST GAS TEMPERATURE:1","Rankine",
	EDC33Callback)