TempBar = {}

function TempBar.new()
	local self = {}
	
	local images = {
		background = img_add("TempBar.png",0,216,320,22)
	
	}
	
	local text = {
		egt = txt_add("1550","-fx-font-family:sans-serif; -fx-font-size:20px; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:right;",67,218,70,25),
		cht = txt_add("460","-fx-font-family:sans-serif; -fx-font-size:20px; -fx-fill: green; -fx-font-weight:bold; -fx-text-alignment:right;",192,218,70,25),
	}
	
	function self.refresh()
		--print("tempBar.refresh")
	
		txt_set(text.egt,var_format(Edc33.cyl[Edc33.current_cylinder].egt*9/5 + 32,0))--to F
		txt_set(text.cht,var_format(Edc33.cyl[Edc33.current_cylinder].cht*9/5 + 32,0))--to F
	end
	
	return self
end
