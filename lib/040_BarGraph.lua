BarGraphAnalyzer = {}

function BarGraphAnalyzer:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	
	self.images = {
		overlay = img_add_fullscreen("barMatrixOverlay.png")
	}
	return o
end





