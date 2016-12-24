rpmAndMap = RpmAndMap:new()


function pageRefresh()
	RpmAndMap:refresh()
end

function anunciatorRefresh()
	RpmAndMap:anuninciators_refresh()
end

refreshTimers = {
	rpmandMap = timer_start(30,30,pageRefresh),
	anunciator = timer_start(500,500,anunciatorRefresh)
}