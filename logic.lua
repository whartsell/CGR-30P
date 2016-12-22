blink = false
rpm = 0
img_add('MainScreen.png',0,0,320,240)
img_add('RPMandMAP.png',0,0,320,240)
img_map1 = img_add('rpmMapPointer.png',19,16,141,142)
img_rpm1 = img_add('rpmMapPointer.png',163,16,141,142)
txt_map1 = txt_add("22.5","-fx-font-family:sans-serif; -fx-font-size:35px; -fx-fill: green; -fx-font-weight:bold; -fx-text-alignment:right;",60,55,70,36)
txt_rpm1_green = txt_add("2060","-fx-font-family:sans-serif; -fx-font-size:35px; -fx-fill: green; -fx-font-weight:bold; -fx-text-alignment:right;",195,55,80,36)
txt_rpm1_yellow = txt_add("2060","-fx-font-family:sans-serif; -fx-font-size:35px; -fx-fill: yellow; -fx-font-weight:bold; -fx-text-alignment:right;",195,55,80,36)
txt_rpm1_red = txt_add("2060","-fx-font-family:sans-serif; -fx-font-size:35px; -fx-fill: red; -fx-font-weight:bold; -fx-text-alignment:right;",195,55,80,36)
-- 130 degrees
--43 end of greenline 2550
--49 deg start of redline 2625

function rpm_WarnAlert_callback()
	visible(txt_rpm1_green,rpm <=2550)
	visible(txt_rpm1_yellow,(2550 < rpm) and (rpm <2625))
	if rpm > 2624 then
		blink = not blink
	end
	visible(txt_rpm1_red,(rpm > 2624) and (blink))
	
end

function rpm_callback(rpm1,psi1)
	print("map:" .. psi1)
	print("rpm:" .. rpm1)
	rpm = rpm1
	local map1_angle = var_cap((130/32)*psi1 -65,-65,65)
	txt_set(txt_map1,var_format(psi1,1))
	txt_set(txt_rpm1_green,var_format(rpm1,0))
	txt_set(txt_rpm1_yellow,var_format(rpm1,0))
	txt_set(txt_rpm1_red,var_format(rpm1,0))
	if rpm1 <= 2550 then
		rpm1_angle = var_cap((108/2550)*rpm1 -65,-65,65)
	else
		rpm1_angle = var_cap(43 + (5/75)* (rpm1 -2550),-65,65)
		
	end
	img_rotate(img_map1,map1_angle,-65.65)
	img_rotate(img_rpm1,rpm1_angle)
end



timer_start(30,500,rpm_WarnAlert_callback)


fsx_variable_subscribe("GENERAL ENG RPM:1", "Rpm",
	"RECIP ENG MANIFOLD PRESSURE:1", "Psi",rpm_callback)