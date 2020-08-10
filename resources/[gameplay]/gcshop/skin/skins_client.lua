local shopTabPanel
local cdTime = 5 -- selling skins cooldown time in sec, prevents a bug where you can spam and sell one item at twice the price
local cooldown = false

function previewSkin(button, state)
	if state == "up" and button == "left" then
		local row, col = guiGridListGetSelectedItem(skinGrid)
		if row == -1 or col == -1 or row == false then return end
		local id = guiGridListGetItemText(skinGrid, row, colId)
		if id == "" then return end
		if getElementModel(getLocalPlayer()) ~= tonumber(id) then
			setElementModel(getLocalPlayer(), tonumber(id))
		end
		if isTimer(changeBack) then killTimer(changeBack) end
		changeBack = setTimer(setElementModel, 5000, 1, getLocalPlayer(), 0)  --back to cj
	end
end

addEvent("onServerSkinData", true)
addEventHandler("onServerSkinData", root,
function(success)
	if not success then
		if guiGetVisible(successLabel) or guiGetVisible(failLabel3) then
			guiSetVisible(successLabel, false)
			guiSetVisible(failLabel3, false)
		end
		guiSetVisible(failLabel, true)
		guiSetVisible(failLabel2, true)
	else
		if isTimer(changeBack) then killTimer(changeBack) end
		triggerServerEvent('getSkinPurchases', getLocalPlayer())
		if guiGetVisible(failLabel) or guiGetVisible(failLabel3) then
			guiSetVisible(failLabel, false)
			guiSetVisible(failLabel2, false)
			guiSetVisible(failLabel3, false)
		end
		guiSetVisible(successLabel, true)
	end
end
)

addEvent('onServerSuccessfulSkinSell', true)
addEventHandler('onServerSuccessfulSkinSell', root,
function(success)
	if success then
		if isTimer(changeBack) then killTimer(changeBack) end
		triggerServerEvent('getSkinPurchases', getLocalPlayer())
		if guiGetVisible(failLabel) or guiGetVisible(failLabel3) then
			guiSetVisible(failLabel, false)
			guiSetVisible(failLabel2, false)
			guiSetVisible(failLabel3, false)
		end
		guiSetVisible(successLabel, true)
	else
		outputChatBox(_("Selling failed! You are either not logged in or don't have that skin!"), 255, 0, 0)
		cooldown = false
	end
end)


function buySkin(button, state)
	if state == "up" and button == "left" then
		local row, col = guiGridListGetSelectedItem(skinGrid)
		if row == -1 or col == -1 or row == false then return end
		local id = guiGridListGetItemText(skinGrid, row, colId)
		if id == "" then return end
		if isTimer(changeBack) then killTimer(changeBack) end
		setElementModel(getLocalPlayer(), currentID)
		triggerServerEvent('onPlayerChooseSkin', getLocalPlayer(), tostring(id))
	end
end


function sellSkin(button, state)
	if state == "up" and button == "left" and cooldown == false then
		cooldown = true
		local row, col = guiGridListGetSelectedItem(skinGrid)
		if row == -1 or col == -1 or row == false then
			cooldown = false
			return
		end
		local id = guiGridListGetItemText(skinGrid, row, colId)
		if id == "" then
			cooldown = false
			outputChatBox(_("Please select the skin you want to sell!"), 255, 0, 0)
			return
		end

		setTimer(function()
			cooldown = false
		end, cdTime * 1000, 1)

		triggerServerEvent('onPlayerSellSkin', getLocalPlayer(), tostring(id))
	elseif state == "up" and button == "left" and cooldown == true then
		outputChatBox("You can sell skins once every " .. cdTime .. " seconds!", 255, 0, 0)
	end
end


function useButton(button, state)
	if state == "up" and button == "left" then
			local row, col = guiGridListGetSelectedItem(skinGrid)
			if row == -1 or col == -1 or row == false then return end
			local id = guiGridListGetItemText(skinGrid, row, colId)
			if id == "" then return end
			if isTimer(changeBack) then killTimer(changeBack) end
			setElementModel(getLocalPlayer(), currentID)
			triggerServerEvent('onPlayerUseSkin', getLocalPlayer(), tostring(id))
	end
end

function disableSkins(button, state)
	if state == "up" and button == "left" then
		triggerServerEvent('disableSkins', getLocalPlayer())
	end
end

--[[addEvent('onClientGreencoinsLogin', true)
addEventHandler('onClientGreencoinsLogin', root,
function()
	triggerServerEvent('getSkinPurchases', getLocalPlayer())
end
)
]]


function onShopInit ( tabPanel )
	shopTabPanel = tabPanel
	--triggerServerEvent('getSkinPurchases', getLocalPlayer())
	skinTab = guiCreateTab("Buy skins", shopTabPanel)
	skinGrid = guiCreateGridList(0.01,0.02,0.40,0.97, true, skinTab)
	guiGridListSetSortingEnabled(skinGrid, false)
	skinCol = guiGridListAddColumn(skinGrid, "Skin", 0.7)
	colId = guiGridListAddColumn(skinGrid, "ID", 0.2)
	local node = xmlLoadFile('skin/skins.xml')
	local childrenGroups = xmlNodeGetChildren(node)
	for _, group in ipairs(childrenGroups) do
		local skinName = xmlNodeGetAttribute(group, "name")
		local row = guiGridListAddRow(skinGrid)
		guiGridListSetItemText(skinGrid, row, skinCol, "Group: "..skinName, false, false)
		guiGridListSetItemColor(skinGrid, row, skinCol, 255, 0, 0)
		for __, name in ipairs(xmlNodeGetChildren(group)) do
			skinName = xmlNodeGetAttribute(name, "name")
			local skinID = xmlNodeGetAttribute(name, "id")
			row = guiGridListAddRow(skinGrid)
			guiGridListSetItemText(skinGrid, row, skinCol, "       "..skinName, false, false)
			guiGridListSetItemText(skinGrid, row, colId, skinID, false, false)
		end
	end
	skinBuySellLabel = guiCreateLabel(0.4274,0.0505,0.45,0.05,"Buy price: 1500 GCs | Sell price: 750 GCs",true,skinTab)
	skinMultipleLabel = guiCreateLabel(0.4274,0.1009,0.45,0.05,"You can own multiple skins, but only use one.",true, skinTab)
	-- exactSkins = guiCreateLabel(0.4274,0.1537,0.55,0.05,"Owned skins:",true,skinTab)
	-- exactSkins2 = guiCreateLabel(0.4274,0.2037,0.55,0.05,"",true,skinTab)
	-- exactSkins3 = guiCreateLabel(0.4274,0.2537,0.55,0.05,"",true,skinTab)
	failLabel = guiCreateLabel(0.55, 0.75, 0.45, 0.1, "Not enough money/skin already bought", true, skinTab)
	failLabel3 = guiCreateLabel(0.55, 0.75, 0.45, 0.1, "Please input a number.", true, skinTab)
	failLabel2 = guiCreateLabel(0.55, 0.80, 0.45, 0.1, "Or not logged in", true, skinTab)
	successLabel = guiCreateLabel(0.55, 0.75, 0.45, 0.1, "Skin bought/sold successfully!", true, skinTab)
	guiSetVisible(failLabel, false)
	guiSetVisible(failLabel2, false)
	guiSetVisible(successLabel, false)
	guiSetVisible(failLabel3, false)
	skinPreviewButton = guiCreateButton(0.55, 0.85, 0.15, 0.05, "Preview skin", true,skinTab)
	addEventHandler ( "onClientGUIClick", skinPreviewButton, previewSkin,false )
	skinBuyButton = guiCreateButton(0.75, 0.85, 0.15, 0.05, "Buy skin", true,skinTab)
	addEventHandler ( "onClientGUIClick", skinBuyButton, buySkin,false)
	skinSellButton = guiCreateButton(0.75, 0.92, 0.15, 0.05, "Sell skin", true,skinTab)
	addEventHandler ( "onClientGUIClick", skinSellButton, sellSkin,false)
	skinUseButton = guiCreateButton(0.4342,0.5298,0.15,0.05,"Set primary skin",true,skinTab)
	addEventHandler ( "onClientGUIClick",skinUseButton, useButton,false)
	--edit = guiCreateEdit(0.4342,0.4151,0.15,0.05, "Enter skin ID", true, skinTab)
	skinDisableButton = guiCreateButton(0.4342,0.4151,0.15,0.05, "Disable feature", true,skinTab)
	--addEventHandler ( "onClientGUIClick", edit, editBox,false)
	addEventHandler ( "onClientGUIClick", skinDisableButton, disableSkins,false)
	currentID = getElementModel(localPlayer) or 0
	translateSkinsGUI()
end
addEvent('onShopInit', true)
addEventHandler('onShopInit', root, onShopInit )

function translateSkinsGUI()
	guiGridListSetColumnTitle(skinGrid, skinCol, _.context("Character model", "Skin"))
	guiSetText(skinTab, _("Buy skins"))
	guiSetText(skinBuySellLabel, _("Buy price: %s GCs | Sell price: %s GCs"):format(1500, 750))
	guiSetText(skinMultipleLabel, _("You can own multiple skins, but only use one."))
	guiSetText(failLabel, _("Not enough GreenCoins or you already own this skin"))
	guiSetText(failLabel3, _("Please input a number"))
	guiSetText(failLabel2, _("Or not logged in"))
	guiSetText(successLabel, _("Skin bought/sold successfully!"))
	guiSetText(skinPreviewButton, _("Preview skin"))
	guiSetText(skinBuyButton, _("Buy skin"))
	guiSetText(skinSellButton, _("Sell skin"))
	guiSetText(skinUseButton, _("Set primary skin"))
	guiSetText(skinDisableButton, _("Disable skins feature"))
end
addEventHandler("onClientPlayerLocaleChange", root, translateSkinsGUI)

addEvent("sendPlayerSkinPurchases", true)
addEventHandler("sendPlayerSkinPurchases", root,
function(purchases, current)
	if purchases == false then
		-- guiSetText(exactSkins, _('Your ID purchases so far: %s'):format(""))
		-- guiSetText(exactSkins2, '')
		-- guiSetText(exactSkins3, '')
		local rows = guiGridListGetRowCount(skinGrid)
		for i = 0, rows do
			if not string.find(guiGridListGetItemText(skinGrid, i, 1), 'Group') then
				guiGridListSetItemColor(skinGrid, i, 1, 255, 255, 255)
				guiGridListSetItemColor(skinGrid, i, 2, 255, 255, 255)
			end
		end
		return
	end
	oPurchases = purchases
	oPurchases = ','..oPurchases..','
	currentID = tonumber(current) or 0
	local _table = split(purchases, ',')
	local rows = guiGridListGetRowCount(skinGrid)
	-- guiSetText(exactSkins, _('Your ID purchases so far: %s'):format(""))
	-- guiSetText(exactSkins2, '')
	-- guiSetText(exactSkins3, '')
	-- for i, purchase in ipairs(_table) do
	-- 	if i < 10 then
	-- 		if guiGetText(exactSkins) == 'Your ID purchases so far: none' then
	-- 			guiSetText(exactSkins, "Your ID purchases so far: "..tostring(purchase))
	-- 		else
	-- 			guiSetText(exactSkins, guiGetText(exactSkins)..','..tostring(purchase))
	-- 		end
	-- 	elseif i < 25 then
	-- 		if guiGetText(exactSkins2) == '' then
	-- 			guiSetText(exactSkins2, tostring(purchase))
	-- 		else
	-- 			guiSetText(exactSkins2, guiGetText(exactSkins2)..','..tostring(purchase))
	-- 		end
	-- 	else
	-- 		if guiGetText(exactSkins3) == '' then
	-- 			guiSetText(exactSkins3, tostring(purchase))
	-- 		else
	-- 			guiSetText(exactSkins3, guiGetText(exactSkins3)..','..tostring(purchase))
	-- 		end
	-- 	end
	-- end
	local x,y
	for i = 0, rows do
		local gridID = guiGridListGetItemText(skinGrid, i, 2)
		if string.find(oPurchases, ','..gridID..',') and not string.find(guiGridListGetItemText(skinGrid, i, 1), 'Group') then
			guiGridListSetItemColor(skinGrid, i, 1, 0, 255, 0)
			guiGridListSetItemColor(skinGrid, i, 2, 0, 255, 0)
		elseif not string.find(oPurchases, ','..gridID..',') and not string.find(guiGridListGetItemText(skinGrid, i, 1), 'Group') then
			guiGridListSetItemColor(skinGrid, i, 1, 255, 255, 255)
			guiGridListSetItemColor(skinGrid, i, 2, 255, 255, 255)
		end
	end
	--guiSetText(exactSkins, "Your ID purchases so far: "..purchases)
	--guiLabelSetHorizontalAlign(exactSkins,"left",true)
end
)


addEvent("skinsLogout", true)
addEventHandler("skinsLogout", root,
function()
	logged = false
	--[[if shopTabPanel and skinTab then
		guiDeleteTab ( skinTab, shopTabPanel )
		skinTab = nil
	end]]
end
)

addEvent("skinsLogin", true)
addEventHandler("skinsLogin", root,
function()
	logged = true
	-- guiSetText(exactSkins, 'Your ID purchases so far: none')
	-- guiSetText(exactSkins2, '')
	-- guiSetText(exactSkins3, '')
	triggerServerEvent('getSkinPurchases', getLocalPlayer())
end
)






