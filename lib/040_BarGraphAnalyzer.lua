BarGraphAnalyzer = {}

function BarGraphAnalyzer.new()
	local self = {}

	local images = {
		overlay = img_add_fullscreen("barMatrixOverlay.png"),
		chtBox = img_add("CHT_Box.png",31,121,12,12),
	}
	
	local components = {}
		components.cyl = {
			BarGraph.new(27,140),
			BarGraph.new(49.2,140),
			BarGraph.new(71.4,140),
			BarGraph.new(93.6,140),
			BarGraph.new(115.8,140),
			BarGraph.new(138.2,140),
		}
	-- order matters so this has to go last
	images.chtRedline = img_add("CHT_Limit.png",35,176,119,1)
		
		
	function self.refresh()
		--print("BarGraph.refresh")
		local cylOffset = 22
		for i = 1,6 do
			components.cyl[i].refresh(Edc33.cyl[i].cht,Edc33.cyl[i].egt)
		end
		move(images.chtBox,31 + ((Edc33.current_cylinder -1) * cylOffset),nil,nil,nil)
		--print("BarGraph.refresh done")
	end
	
	
	return self
		
end





