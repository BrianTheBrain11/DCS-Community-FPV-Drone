
local openFormation = true

function performCommand()
	dev = data.base.GetDevice(11)
	dev:performClickableAction(3000, 0.0, true)
end

function specialEvent(params) 
	return staticParamsEvent(Message.wMsgLeaderSpecialCommand, params)
end

local menus = data.menus

data.rootItem = {
	name = _('Main'),
	getSubmenu = function(self)	
		local tbl = {
			name = _('Main'),
			items = {}
		}
		
		if data.pUnit == nil or data.pUnit:isExist() == false then
			return tbl
		end
		
		if self.builders ~= nil then
			for index, builder in pairs(self.builders) do
				builder(self, tbl)
			end
		end
		
		if #data.menuOther.submenu.items > 0 then
			tbl.items[10] = {
				name = _('Other'),
				submenu = data.menuOther.submenu
			}
		end
		
		return tbl
	end,
	builders = {}
}

local parameters = {
	fighter = false,
	radar = false,
	ECM = false,
	refueling = true
}

--utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/LockOnAirplane.lua', getfenv()))(9)
utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/Ground Crew.lua', getfenv()))(8)

menus['Wheel chocks'] = {
	name = _('Wheel chocks'),
	items = {
		[1] = {
			name = _('Place'), 		
			command = sendMessage.new(Message.wMsgLeaderGroundToggleWheelChocks, true)
		},
		[2] = {
			name = _('Remove'),
			command = sendMessage.new(Message.wMsgLeaderGroundToggleWheelChocks, false)
		}
	}
}


menus['Ground Crew'].items[4] = { name = _('Wheel Chocks'), submenu = menus['Wheel Chocks']}
menus['Ground Crew'].items[5] = {name = _('Start priming engines'), command = specialEvent({type = COMMAND_MAINTAIN_PRIMING})}