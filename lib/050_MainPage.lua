MainPage = {}

function MainPage.new()
	local self = {}
	
	local images = {
		background = img_add_fullscreen("MainScreen.png"),
	}
	
	local components = {
		rpmAndMap = RpmAndMap.new(),
		barGraphAnalyzer = BarGraphAnalyzer.new(),
		tempBar = TempBar.new(),
	}

	function self.refresh()
		--print("MainPage:refresh")
		components.rpmAndMap.refresh()
		components.barGraphAnalyzer.refresh()
		components.tempBar.refresh()
	end
	
	local function anunciators_refresh()
		print("anunciators_refresh")
		components.rpmAndMap.anuninciators_refresh()
	end
	
	refreshTimers = {
	anunciator = timer_start(0,500,anunciators_refresh),
	}
	return self
end	




