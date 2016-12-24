BarGraphAnalyzer = {}

function BarGraphAnalyzer:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	
	self.images = {
		overlay = img_add_fullscreen("barMatrixOverlay.png")
	}
	
	self.components = {
		cyl1 = BarGraph.new(27,140),
		cyl2 = BarGraph.new(49.2,140),
		cyl3 = BarGraph.new(71.4,140),
		cyl4 = BarGraph.new(93.6,140),
		cyl5 = BarGraph.new(115.8,140),
		cyl6 = BarGraph.new(138.2,140),
	}
	return o
end

function BarGraphAnalyzer:refresh()
	local cht1 = EDC33:safeGetData("cht1")
	local cht2 = EDC33:safeGetData("cht2")
	local cht3 = EDC33:safeGetData("cht3")
	local cht4 = EDC33:safeGetData("cht4")
	local cht5 = EDC33:safeGetData("cht5")
	local cht6 = EDC33:safeGetData("cht6")
	local egt1 = EDC33:safeGetData("egt1")
	local egt2 = EDC33:safeGetData("egt2")
	local egt3 = EDC33:safeGetData("egt3")
	local egt4 = EDC33:safeGetData("egt4")
	local egt5 = EDC33:safeGetData("egt5")
	local egt6 = EDC33:safeGetData("egt6")
	self.components.cyl1.refresh(cht1,egt1)
	self.components.cyl2.refresh(cht2,egt2)
	self.components.cyl3.refresh(cht3,egt3)
	self.components.cyl4.refresh(cht4,egt4)
	self.components.cyl5.refresh(cht5,egt5)
	self.components.cyl6.refresh(cht6,egt6)
end



