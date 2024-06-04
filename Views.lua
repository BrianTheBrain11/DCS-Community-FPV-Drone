ViewSettings = 
{
    Cockpit  = 
    {
        [1] =
        {
            CockpitLocalPoint = {0.0, 0.0, 0.0},
            CameraViewAngleLimits = {20, 280},
            CameraAngleRestriction = {false, 90, 0.05},
            CameraAngleLimits = {360, -90, 45},
            limits_6DOF = {x = {0, 0}, y = {0, 0}, z = {0, 0}, roll = 90.0},
            EyePoint = {0.0, 0.0, 0.0},
            ShoulderSize = 0.0,
            Allow360Rotation = true,
        }
    }
}

local function pilot_head_pos(tab)	-- adjusts pilot view from origin of cockpit model
    if not tab then
	   tab = {}
	end
	tab.viewAngle = tab.viewAngle  or 75 -- initial FOV
	tab.hAngle    = tab.hAngle     or  0
	tab.vAngle    = tab.vAngle     or -9 -- angles down pilot view
	tab.x_trans   = tab.x_trans    or  0.0  -- moves pilot view forward from x=0 (cockpit model)
	tab.y_trans   = tab.y_trans    or  0.11  -- moves view up
	tab.z_trans   = tab.z_trans    or  0  -- moves view right
	tab.rollAngle = tab.rollAngle  or  0
	return tab
end

SnapViews = 
{
    [1] = 
    {-- player slot 1
        [1] = pilot_head_pos({}),	-- num 0
        [2] = pilot_head_pos({}),	--LWin + Num1 : Snap View 1
        [3] = pilot_head_pos({}),
        [4] = pilot_head_pos({}),
        [5] = pilot_head_pos({}),
        [6] = pilot_head_pos({}),
        [7] = pilot_head_pos({}),
        [8] = pilot_head_pos({}),
        [9] = pilot_head_pos({}),
        [10] = pilot_head_pos({}),
        [13] = pilot_head_pos({}),	-- default view
        [14] = pilot_head_pos({}),	-- vr view
    },
}