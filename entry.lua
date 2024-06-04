local self_ID = "Community FPV Drone"

local cfg_path = current_mod_path .. "/Config/"

local useEFM = false -- not currently efm compatible

declare_plugin(self_ID, 
{
    installed = true,
    dirName = current_mod_path,
    version = "0.0.1",
    state = "installed",
    developerName = "DCS Community FPV Drone",
    encyclopedia_path = current_mod_path..'/Encyclopedia',
    binaries = { 'DroneFM' },

    mount_vfs_model_path(current_mod_path.."/Shapes"),

    Skins =
    {
        {
            name = "FPV Drone",
            dir = "Theme",
        },
    },
    Missions =
    {
        {
            name = _("FPV Drone"),
            dir = "Missions",
        },
    },
    LogBook =
    {
        {
            name = _("FPV Drone"),
            type = "FPV Drone",
        },
    },
    InputProfiles =
    {
        ["FPV Drone"] = current_mod_path..'/Input',
    },
    Options = 
    {
        {
            name = _("FPV Drone"),
            nameId = "FPV Drone",
            dir = "Options",
            CLSID = "{FPV Drone Options}"
        },
    },
})

dofile(current_mod_path..'/FPVDrone.lua')
dofile(current_mod_path..'/Views.lua')

local FM = 
{
    [1] = self_ID,
    [2] = "DroneFM",
    config_path = cfg_path,
    center_of_mass = {0.0, 0.0, 0.0},
    moment_of_inertia = {5, 5, 5, -5},
}

if (useEFM) then
    make_flyable('FPV Drone', current_mod_path.."/Cockpit/Scripts/", FM, current_mod_path.."/comm.lua")
else
    make_flyable('FPV Drone', current_mod_path.."/Cockpit/Scripts/", nil, current_mod_path.."/comm.lua")
end

make_view_settigns('FPV Drone', ViewSettings, SnapViews)
plugin_done()