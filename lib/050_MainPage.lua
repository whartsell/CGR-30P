MainPage = {}

function MainPage:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	
	self.images = {
		background = img_add_fullscreen("MainScreen.png"),
	}
	
	self.components = {}
	self.components.rpmAndMap = RpmAndMap:new()
	self.components.barGraphAnalyzer = BarGraphAnalyzer:new()
	print("init complete")
	
	return o
end	

function MainPage:refresh()
	self.components.rpmAndMap:refresh()
end

function MainPage:anunciators_refresh()
	self.components.rpmAndMap:anuninciators_refresh()
end
