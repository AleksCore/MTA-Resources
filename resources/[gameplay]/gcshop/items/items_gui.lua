﻿-------------------------------------
-- Code generated by DKR QT to Lua 0.1.7 --
-- Source: items.ui --
-- Date:  20/12/2012 - 01:19:10 --
-------------------------------------

function build_itemsWidget(parent, offsetX, offsetY)
	
	local gui = {}
	gui._placeHolders = {}
	
	local widgetWidth, widgetHeight = 780, 1054
	
	gui["scrollAreaItems"] = guiCreateScrollPane(0 + offsetX, 0 + offsetY, 661, 375, false, parent)
	
	gui["labelTitle_1"] = guiCreateLabel(21, 11, 200, 13, "1. Bike trials", false, gui["scrollAreaItems"])
	guiSetFont(gui["labelTitle_1"], "default-bold-small")
	guiLabelSetHorizontalAlign(gui["labelTitle_1"], "left", false)
	guiLabelSetVerticalAlign(gui["labelTitle_1"], "center")
	
	gui["labelInfo_1"] = guiCreateLabel(21, 31, 481, 71, "This perk allows you to do stunts on your bike while airborn. You can do tricks by pressing 1-5 and do 360° turns in the air. Also 360° turns will be faster on a decent height.", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_1"], "left", true)
	guiLabelSetVerticalAlign(gui["labelInfo_1"], "top")
	
	gui["btnBuyPerk_1"] = guiCreateButton(541, 11, 101, 101, "Price:\n1000 GC", false, gui["scrollAreaItems"])
	if on_btnBuyPerk_1_clicked then
		addEventHandler("onClientGUIClick", gui["btnBuyPerk_1"], on_btnBuyPerk_1_clicked, false)
	end
	
	gui["btnBuyPerk_2"] = guiCreateButton(541, 121, 101, 101, "Price:\n1000 GC", false, gui["scrollAreaItems"])
	if on_btnBuyPerk_2_clicked then
		addEventHandler("onClientGUIClick", gui["btnBuyPerk_2"], on_btnBuyPerk_2_clicked, false)
	end
	
	gui["labelInfo_2"] = guiCreateLabel(21, 141, 481, 71, "Respawn time will be limited to 1 second. \nIf you hit a checkpoint, it will be chosen as the respawn point much faster now (normally 5 seconds) but you will keep your health.\nExpires after 60 days", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_2"], "left", true)
	guiLabelSetVerticalAlign(gui["labelInfo_2"], "top")
	
	gui["labelTitle_2"] = guiCreateLabel(21, 121, 200, 13, "2. Faster respawn for 60 days", false, gui["scrollAreaItems"])
	guiSetFont(gui["labelTitle_2"], "default-bold-small")
	guiLabelSetHorizontalAlign(gui["labelTitle_2"], "left", false)
	guiLabelSetVerticalAlign(gui["labelTitle_2"], "center")
	
	gui["btnBuyPerk_3"] = guiCreateButton(541, 231, 101, 101, "Price:\n1000 GC", false, gui["scrollAreaItems"])
	if on_btnBuyPerk_3_clicked then
		addEventHandler("onClientGUIClick", gui["btnBuyPerk_3"], on_btnBuyPerk_3_clicked, false)
	end
	
	gui["labelTitle_3"] = guiCreateLabel(21, 231, 200, 13, "3. HP Regen for 30 days", false, gui["scrollAreaItems"])
	guiSetFont(gui["labelTitle_3"], "default-bold-small")
	guiLabelSetHorizontalAlign(gui["labelTitle_3"], "left", false)
	guiLabelSetVerticalAlign(gui["labelTitle_3"], "center")
	
	gui["labelInfo_3"] = guiCreateLabel(21, 251, 481, 71, "Regenerate your health. When damaged, this perk will automatically regenerate your health untill you're back at 100% again.\n\nExpires after 30 days", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_3"], "left", true)
	guiLabelSetVerticalAlign(gui["labelInfo_3"], "top")
	
	gui["labelTitle_4"] = guiCreateLabel(21, 341, 200, 13, "4. Custom paintjob", false, gui["scrollAreaItems"])
	guiSetFont(gui["labelTitle_4"], "default-bold-small")
	guiLabelSetHorizontalAlign(gui["labelTitle_4"], "left", false)
	guiLabelSetVerticalAlign(gui["labelTitle_4"], "center")
	
	gui["btnBuyPerk_4"] = guiCreateButton(541, 341, 101, 101, "Price:\n1000 GC", false, gui["scrollAreaItems"])
	if on_btnBuyPerk_4_clicked then
		addEventHandler("onClientGUIClick", gui["btnBuyPerk_4"], on_btnBuyPerk_4_clicked, false)
	end
	
	gui["labelInfo_4"] = guiCreateLabel(21, 361, 481, 71, "Upload your own custom paintjob images for vehicles with paintjobs! You will be able to do this in the modshop tab. One custom paintjob can be set for all vehicles at the same time. You can buy this multiple times so you can add multiple paintjobs to use.", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_4"], "left", true)
	guiLabelSetVerticalAlign(gui["labelInfo_4"], "top")
	
	gui["labelTitle_5"] = guiCreateLabel(21, 451, 200, 13, "5. Voice", false, gui["scrollAreaItems"])
	guiSetFont(gui["labelTitle_5"], "default-bold-small")
	guiLabelSetHorizontalAlign(gui["labelTitle_5"], "left", false)
	guiLabelSetVerticalAlign(gui["labelTitle_5"], "center")
	
	gui["btnBuyPerk_5"] = guiCreateButton(541, 451, 101, 101, "Price:\n1000 GC", false, gui["scrollAreaItems"])
	if on_btnBuyPerk_5_clicked then
		addEventHandler("onClientGUIClick", gui["btnBuyPerk_5"], on_btnBuyPerk_5_clicked, false)
	end
	
	gui["labelInfo_5"] = guiCreateLabel(21, 471, 481, 71, "Put that mic to good use, this grants you the right to speak freely on the server.", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_5"], "left", true)
	guiLabelSetVerticalAlign(gui["labelInfo_5"], "top")
	
	gui["btnBuyPerk_6"] = guiCreateButton(541, 561, 101, 101, "Price:\n1000 GC", false, gui["scrollAreaItems"])
	if on_btnBuyPerk_6_clicked then
		addEventHandler("onClientGUIClick", gui["btnBuyPerk_6"], on_btnBuyPerk_6_clicked, false)
	end
	
	gui["labelInfo_6"] = guiCreateLabel(21, 581, 481, 71, "This perk will extend the burnup time of your vehicle with 50%.", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_6"], "left", true)
	guiLabelSetVerticalAlign(gui["labelInfo_6"], "top")
	
	gui["labelTitle_6"] = guiCreateLabel(21, 561, 200, 13, "6. Longer burnup time", false, gui["scrollAreaItems"])
	guiSetFont(gui["labelTitle_6"], "default-bold-small")
	guiLabelSetHorizontalAlign(gui["labelTitle_6"], "left", false)
	guiLabelSetVerticalAlign(gui["labelTitle_6"], "center")
	
	gui["btnBuyPerk_7"] = guiCreateButton(541, 671, 101, 101, "Price:\n1000 GC", false, gui["scrollAreaItems"])
	if on_btnBuyPerk_7_clicked then
		addEventHandler("onClientGUIClick", gui["btnBuyPerk_7"], on_btnBuyPerk_7_clicked, false)
	end
	
	gui["labelTitle_7"] = guiCreateLabel(21, 671, 200, 13, "7. Extra long burnup time", false, gui["scrollAreaItems"])
	guiSetFont(gui["labelTitle_7"], "default-bold-small")
	guiLabelSetHorizontalAlign(gui["labelTitle_7"], "left", false)
	guiLabelSetVerticalAlign(gui["labelTitle_7"], "center")
	
	gui["labelInfo_7"] = guiCreateLabel(21, 691, 481, 71, "This perk will extend the burnup time of your vehicle to a total of 100%.\n\nRequires perk 6: Longer burnup time\nExpires after 30 days", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_7"], "left", true)
	guiLabelSetVerticalAlign(gui["labelInfo_7"], "top")
	
	gui["btnBuyPerk_8"] = guiCreateButton(541, 781, 101, 101, "Price:\n1000 GC", false, gui["scrollAreaItems"])
	if on_btnBuyPerk_8_clicked then
		addEventHandler("onClientGUIClick", gui["btnBuyPerk_8"], on_btnBuyPerk_8_clicked, false)
	end
	
	gui["labelTitle_8"] = guiCreateLabel(21, 781, 200, 13, "8. Health transfer", false, gui["scrollAreaItems"])
	guiSetFont(gui["labelTitle_8"], "default-bold-small")
	guiLabelSetHorizontalAlign(gui["labelTitle_8"], "left", false)
	guiLabelSetVerticalAlign(gui["labelTitle_8"], "center")
	
	gui["labelInfo_8"] = guiCreateLabel(21, 801, 481, 71, "The classic fire transfer script. If you're on fire, hit someone and you will steal his health.\n\nRequires perk 6: Longer burnup time\nExpires after 30 days", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_8"], "left", true)
	guiLabelSetVerticalAlign(gui["labelInfo_8"], "top")
	
	gui["btnBuyPerk_9"] = guiCreateButton(541, 891, 101, 101, "Price:\nDisabled", false, gui["scrollAreaItems"])
	if on_btnBuyPerk_9_clicked then
		addEventHandler("onClientGUIClick", gui["btnBuyPerk_9"], on_btnBuyPerk_9_clicked, false)
	end
	
	gui["labelTitle_9"] = guiCreateLabel(21, 891, 200, 13, "9. Double sided objects", false, gui["scrollAreaItems"])
	guiSetFont(gui["labelTitle_9"], "default-bold-small")
	guiLabelSetHorizontalAlign(gui["labelTitle_9"], "left", false)
	guiLabelSetVerticalAlign(gui["labelTitle_9"], "center")
	
	gui["labelInfo_9"] = guiCreateLabel(21, 911, 481, 71, "Makes all objects in a map doublesided (setElementDoubleSided)", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_9"], "left", true)
	guiLabelSetVerticalAlign(gui["labelInfo_9"], "top")
	
	gui["btnExtendScrollarea"] = guiCreateButton(281, 1300, 101, 101, "Price:\n1000 GC", false, gui["scrollAreaItems"])
	guiSetEnabled(gui["btnExtendScrollarea"], false)
	if on_btnExtendScrollarea_clicked then
		addEventHandler("onClientGUIClick", gui["btnExtendScrollarea"], on_btnExtendScrollarea_clicked, false)
	end


	gui["labelTitle_10"] = guiCreateLabel(21, 1001, 200, 13, "10. Colored Rockets for 30 days", false, gui["scrollAreaItems"])
	guiSetFont(gui["labelTitle_10"], "default-bold-small")
	guiLabelSetHorizontalAlign(gui["labelTitle_10"], "left", false)
	guiLabelSetVerticalAlign(gui["labelTitle_10"], "center")
	
	gui["labelInfo_10"] = guiCreateLabel(21, 1021, 481, 71, "Make all your projectiles (rockets) appear in color.\nClick on the Set Color button to change it.", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_10"], "left", true)
	guiLabelSetVerticalAlign(gui["labelInfo_10"], "top")

	gui["labelInfo_10_Coloring"] = guiCreateLabel(21, 1065, 481, 71, "Color:", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_10_Coloring"], "left", true)
	guiSetFont(gui["labelInfo_10_Coloring"], "default-bold-small")
	guiLabelSetVerticalAlign(gui["labelInfo_10_Coloring"], "top")

	RocketColorImage = guiCreateStaticImage(65, 1065, 18, 18, "items/coloredprojectiles/dot_white.png", false,gui["scrollAreaItems"])
    guiSetProperty(RocketColorImage, "ImageColours", "tl:FF00FF00 tr:FF00FF00 bl:FF00FF00 br:FF00FF00") 

    gui["setRocketColorButton"] = guiCreateButton(95, 1065, 101, 20, "Set Color", false, gui["scrollAreaItems"])   
	guiSetEnabled(gui["setRocketColorButton"], false)
	if button_set_rocketcolor then
		addEventHandler("onClientGUIClick", gui["setRocketColorButton"],button_set_rocketcolor,false)
	end

	gui["btnBuyPerk_10"] = guiCreateButton(541, 1001, 101, 101, "Price:\n2000 GC", false, gui["scrollAreaItems"])
	
	if on_btnBuyPerk_10_clicked then
		addEventHandler("onClientGUIClick", gui["btnBuyPerk_10"], on_btnBuyPerk_10_clicked, false)
	end
	

	-- Vehicle Reroll
	gui["labelTitle_11"] = guiCreateLabel(21, 1111, 250, 13, "11. NTS/DD vehicle reroll for 30 days", false, gui["scrollAreaItems"])
	guiSetFont(gui["labelTitle_11"], "default-bold-small")
	guiLabelSetHorizontalAlign(gui["labelTitle_11"], "left", false)
	guiLabelSetVerticalAlign(gui["labelTitle_11"], "center")
	
	gui["labelInfo_11"] = guiCreateLabel(21, 1131, 481, 71, "Having a bad vehicle in NTS/DD, with this perk you can change it once per map. \nPress 'c' or /rerollvehicle to activate.", false, gui["scrollAreaItems"])
	guiLabelSetHorizontalAlign(gui["labelInfo_11"], "left", true)
	guiLabelSetVerticalAlign(gui["labelInfo_11"], "top")

	gui["btnBuyPerk_11"] = guiCreateButton(541, 1111, 101, 101, "Price:\n2000 GC", false, gui["scrollAreaItems"])
	
	if on_btnBuyPerk_11_clicked then
		addEventHandler("onClientGUIClick", gui["btnBuyPerk_11"], on_btnBuyPerk_11_clicked, false)
	end
	
	return gui, widgetWidth, widgetHeight
end

-- End of DKR QT to Lua code --
