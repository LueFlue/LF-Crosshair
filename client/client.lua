-----------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                                                     --
--       /$$$$$$$$ /$$                                             /$$        /$$$$$$   /$$                     /$$ /$$                 --
--      | $$_____/| $$                                            | $$       /$$__  $$ | $$                    | $$|__/                --
--      | $$     /$$$$$$    /$$$$$$   /$$$$$$  /$$$$$$$   /$$$$$$ | $$      | $$  \__//$$$$$$   /$$   /$$  /$$$$$$$ /$$  /$$$$$$       --
--      | $$$$$ |_  $$_/   /$$__  $$ /$$__  $$| $$__  $$ |____  $$| $$      |  $$$$$$|_  $$_/  | $$  | $$ /$$__  $$| $$ /$$__  $$      --
--      | $$__/   | $$    | $$$$$$$$| $$  \__/| $$  \ $$  /$$$$$$$| $$       \____  $$ | $$    | $$  | $$| $$  | $$| $$| $$  \ $$      --
--      | $$      | $$ /$$| $$_____/| $$      | $$  | $$ /$$__  $$| $$       /$$  \ $$ | $$ /$$| $$  | $$| $$  | $$| $$| $$  | $$      --
--      | $$$$$$$$|  $$$$/|  $$$$$$$| $$      | $$  | $$|  $$$$$$$| $$      |  $$$$$$/ |  $$$$/|  $$$$$$/|  $$$$$$$| $$|  $$$$$$/      --
--      |________/ \___/   \_______/|__/      |__/  |__/ \_______/|__/       \______/   \___/   \______/  \_______/|__/ \______/       --
--                                                                                                                                     --
-----------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                                                     --
--                                           Copyright © 2024 Etneral Studio All Rights Reserved                                       --
--                                                                                                                                     --
-----------------------------------------------------------------------------------------------------------------------------------------

local previousCrosshair = nil 

RegisterNUICallback('displayCrosshair', function(data)
    if not previousCrosshair or previousCrosshair.link ~= data.link or previousCrosshair.size ~= data.size then
        SendNUIMessage({
            type = 'displayCrosshair',
            link = data.link,
            size = data.size
        })
        previousCrosshair = { link = data.link, size = data.size }
    end
end)

DisplayCrosshair = function()
    local input = lib.inputDialog(Eternal.Dialog.title, {
        {type = 'input', label = Eternal.Dialog.link.title, description = Eternal.Dialog.link.description, placeholder = Eternal.Dialog.link.placeholder},
        {type = 'number', label = Eternal.Dialog.sizeOption.title, description = Eternal.Dialog.sizeOption.description, placeholder = Eternal.Dialog.sizeOption.placeholder, min = Eternal.Dialog.size.min, max = Eternal.Dialog.size.max},
    })
    
    if not input then return end

    local link = input[1] and input[1]:trim() or ''
    local size = tonumber(input[2])

    if link == '' then
        lib.notify({
            title = Eternal.Notify.NoLink.title,
            type = Eternal.Notify.NoLink.type,
            position = Eternal.Notify.NoLink.position,
            showDuration = Eternal.Notify.NoLink.showDuration
        })
        return
    end

    if not size or size < Eternal.Dialog.size.min or size > Eternal.Dialog.size.max then
        lib.notify({
            title = Eternal.Notify.InvalidSize.title,
            type = Eternal.Notify.InvalidSize.type,
            position = Eternal.Notify.InvalidSize.position,
            showDuration = Eternal.Notify.InvalidSize.showDuration
        })
        return
    end

    lib.notify({
        title = Eternal.Notify.CrosshairActive.title,
        description = Eternal.Notify.CrosshairActive.description,
        type = Eternal.Notify.CrosshairActive.type,
        position = Eternal.Notify.CrosshairActive.position,
        Duration = Eternal.Notify.CrosshairActive.Duration,
        showDuration = Eternal.Notify.CrosshairActive.showDuration
    })

    if not previousCrosshair or previousCrosshair.link ~= link or previousCrosshair.size ~= size then
        previousCrosshair = { link = link, size = size }
        SendNUIMessage({
            type = 'displayCrosshair',
            link = link,
            size = size
        })
        SetResourceKvp("crosshair", json.encode(previousCrosshair))
    end
end

function string.trim(s)
    return s:match("^%s*(.-)%s*$")
end

CreateThread(function()
    Wait(500)
    LoadCrosshair()
end)

function LoadCrosshair()
    local kvp = GetResourceKvpString("crosshair")
    if kvp then
        local crosshair = json.decode(kvp)
        if crosshair and crosshair.link and crosshair.size then
            if not previousCrosshair or previousCrosshair.link ~= crosshair.link or previousCrosshair.size ~= crosshair.size then
                previousCrosshair = crosshair
                SendNUIMessage({
                    type = 'displayCrosshair',
                    link = crosshair.link,
                    size = tonumber(crosshair.size) or 100
                })
            end
        end
    end
end

if Eternal.Enabled then
    RegisterCommand('crosshair', function()
        lib.showContext('eternal_crosshairmenu')
    end)
end

lib.registerContext({
    id = 'eternal_crosshairmenu',
    title = Eternal.Menu.title,
    options = {
        Eternal.Enabled and {
            title = Eternal.Menu.basicInfo.title,
            description = Eternal.Menu.basicInfo.description,
            icon = Eternal.Menu.basicInfo.icon,
            progress = Eternal.Menu.basicInfo.progress,
            colorScheme = Eternal.Menu.basicInfo.colorScheme,
            readOnly = true,
            metadata = Eternal.Watermark and {
                {label = 'Made by', value = 'Eternal Studio'},
                {label = 'Discord', value = '.gg/h96X7M9YPc'}
            } or nil,
        } or nil,
        {
            title = Eternal.Menu.crosshair.title,
            description = Eternal.Menu.crosshair.description,
            icon = Eternal.Menu.crosshair.icon,
            arrow = Eternal.Menu.crosshair.arrow,
            onSelect = function()
                DisplayCrosshair()
            end
        },
        {
            title = Eternal.Menu.removeCrosshair.title,
            description = Eternal.Menu.removeCrosshair.description,
            icon = Eternal.Menu.removeCrosshair.icon,
            arrow = Eternal.Menu.removeCrosshair.arrow,
            onSelect = function()
                SendNUIMessage({
                    type = 'displayCrosshair',
                    link = '', 
                    size = 0
                })
                SetResourceKvp("crosshair", '') 
                previousCrosshair = nil 
                lib.notify({
                    title = Eternal.Notify.CrosshairRemoved.title,
                    description = Eternal.Notify.CrosshairRemoved.description,
                    type = Eternal.Notify.CrosshairRemoved.type,
                    position = Eternal.Notify.CrosshairRemoved.position,
                    showDuration = Eternal.Notify.CrosshairRemoved.showDuration
                })
            end
        },
        Eternal.Menu.premadeCrosshairs.enabled and {
            title = Eternal.Menu.premadeCrosshairs.title,
            description = Eternal.Menu.premadeCrosshairs.description,
            icon = Eternal.Menu.premadeCrosshairs.icon,
            menu = 'eternal_premade_crosshair',
            arrow = Eternal.Menu.premadeCrosshairs.arrow
        } or nil,
    }
})


if lib and lib.registerContext then
    local context = {
        id = 'eternal_premade_crosshair',
        title = Eternal.Premade.title,
        menu = 'eternal_crosshairmenu',
        options = {}
    }

    for _, crosshair in ipairs(Eternal.Premade.crosshairs) do
        table.insert(context.options, {
            title = crosshair.title,
            description = crosshair.description,
            icon = crosshair.icon,
            image = crosshair.link,
            onSelect = function()
                SetPremadeCrosshair(crosshair.link, crosshair.size)
                lib.notify({
                    title = Eternal.Notify.CrosshairActive.title,
                    description = Eternal.Notify.CrosshairActive.description,
                    type = Eternal.Notify.CrosshairActive.type,
                    position = Eternal.Notify.CrosshairActive.position,
                    duration = Eternal.Notify.CrosshairActive.duration,
                    showDuration = Eternal.Notify.CrosshairActive.showDuration
                })
            end
        })
    end

    lib.registerContext(context)
end

function SetPremadeCrosshair(link, size)
    previousCrosshair = { link = link, size = size }
    SendNUIMessage({
        type = 'displayCrosshair',
        link = link,
        size = size
    })
    SetResourceKvp("crosshair", json.encode(previousCrosshair))
end
