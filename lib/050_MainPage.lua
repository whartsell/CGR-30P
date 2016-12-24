MainPage = {}

function MainPage.new()
	local self = {}
	
	local images = {
		background = img_add_fullscreen("MainScreen.png"),
	}
	
	local components = {
		rpmAndMap = RpmAndMap.new(),
		barGraphAnalyzer = BarGraphAnalyzer.new(),
	}

	function self.refresh()
		--print("MainPage:refresh")
		components.rpmAndMap.refresh()
		components.barGraphAnalyzer.refresh()
	end
	
	function self.anunciators_refresh()
		components.rpmAndMap.anuninciators_refresh()
	end
	
	return self
end	




