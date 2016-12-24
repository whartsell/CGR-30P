BarGraph = {}

function BarGraph.new(x,y)
	local self = {}
	
	local x = x
	local y = y
	local min_egt = 1000 -- should be moved to edc33
	local max_egt = 1600 -- should be moved to edc33
	local min_cht = 100
	local max_cht = 460 -- this is the redline
	
	local images = {
		egt = img_add("EGT_bar.png",x,y,8,75),
		cht = img_add("CHT_bar.png",x + 9,y,6,75),
	}
	local viewports = {
		egt = viewport_rect(images.egt,x,y,8,75),
		cht = viewport_rect(images.cht,x + 9,y,6,75),
	}

	function self.refresh(cht,egt)
		local cht = cht*9/5 + 32
		local egt = egt*9/5 + 32
		local egt_delta_y = var_cap((egt-max_egt) * (75/(max_egt - min_egt)),-74,0)
		local cht_delta_y = var_cap((cht-max_cht) * (39/(max_cht - min_cht))-36,-74,0)
		move(images.egt,nil,y-egt_delta_y,nil,nil)
		move(images.cht,nil,y-cht_delta_y,nil,nil)
	end
	
	return self
end

