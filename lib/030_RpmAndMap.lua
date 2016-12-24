RpmAndMap = {}

function RpmAndMap.new()
	local self = {}
	
	local blink = false
	local images = {
		background = img_add('RPMandMAP.png',0,0,320,240),
		rpm_pointer = img_add('rpmMapPointer.png',163,16,141,142),
		map_pointer = img_add('rpmMapPointer.png',19,16,141,142),
	}
	
	local text = {
		map = txt_add("22.5","-fx-font-family:sans-serif; -fx-font-size:35px; -fx-fill: green; -fx-font-weight:bold; -fx-text-alignment:right;",60,55,70,36),
		rpm_red = txt_add("2060","-fx-font-family:sans-serif; -fx-font-size:35px; -fx-fill: red; -fx-font-weight:bold; -fx-text-alignment:right;",195,55,80,36),
		rpm_yellow = txt_add("2060","-fx-font-family:sans-serif; -fx-font-size:35px; -fx-fill: yellow; -fx-font-weight:bold; -fx-text-alignment:right;",195,55,80,36),
		rpm_green = txt_add("2060","-fx-font-family:sans-serif; -fx-font-size:35px; -fx-fill: green; -fx-font-weight:bold; -fx-text-alignment:right;",195,55,80,36),
	}

	--arc is 130 degrees
	-- greenline ends at 43 deg and 2550 rpm
	-- redline starts at 49 deg and 2625 rpm
	function self.refresh()
		local map = EDC33:safeGetData('map')
		local rpm = EDC33:safeGetData('rpm')
		local rpm_anunciator = EDC33:safeGetData("rpmAnunciator")
		local map_angle = var_cap((130/32)*map -65,-65,65)
		local rpm_angle = 0
		
		if rpm <= 2550 then
			rpm_angle = var_cap((108/2550)*rpm -65,-65,65)
		else
			rpm_angle = var_cap(43 + (5/75)* (rpm -2550),-65,65)
			
		end
		
		visible(text.rpm_green,rpm_anunciator == 0)
		visible(text.rpm_yellow,rpm_anunciator == 1)
		visible(text.rpm_red,(rpm_anunciator == 2) and (blink))
		
		txt_set(text.map,var_format(map,1))
		txt_set(text.rpm_red,var_format(rpm,0))
		txt_set(text.rpm_yellow,var_format(rpm,0))
		txt_set(text.rpm_green,var_format(rpm,0))
		img_rotate(images.map_pointer,map_angle)
		img_rotate(images.rpm_pointer,rpm_angle)
	end
	
	function self.anuninciators_refresh()
		local rpm_anunciator = EDC33:safeGetData("rpmAnunciator")
		if (rpm_anunciator == 2) then
			blink = not blink
		end
	
	end
	
	return self
end





