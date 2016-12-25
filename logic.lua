
mainPage = MainPage:new()

function pageRefresh()
	--print("pageRefresh")
	mainPage.refresh()
end


refreshTimers = {
	mainPage = timer_start(0,30,pageRefresh),
}