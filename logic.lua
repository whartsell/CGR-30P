
mainPage = MainPage:new()

function pageRefresh()
	mainPage:refresh()
end

function anunciatorRefresh()
	mainPage:anunciators_refresh()
end

refreshTimers = {
	mainPage = timer_start(0,30,pageRefresh),
	anunciator = timer_start(0,500,anunciatorRefresh)
}