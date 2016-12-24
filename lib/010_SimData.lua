SimData = {}

function SimData.new()
	local self = {}
	self.data = {}
	
	function self.Update(aData)
		for key,value in pairs(aData) do
			self.data[key] = value
			--print(key,value)
		end
	end
		
	function self.safeGetData(key)
		--print('key is',key)
		if self.data[key] ~= nil then return self.data[key]
		else 
			print('found nil returning 0 for:',key)
			return 0
		end
	end	
	
	return self
end





-- this needs to be global so we'll init it here
--SimData = SimData:new()
