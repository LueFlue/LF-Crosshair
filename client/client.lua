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
    local input = lib.inputDialog(Config.Dialog.title, {
        {type = 'input', label = Config.Dialog.link.title, description = Config.Dialog.link.description, placeholder = Config.Dialog.link.placeholder},
        {type = 'number', label = Config.Dialog.sizeOption.title, description = Config.Dialog.sizeOption.description, placeholder = Config.Dialog.sizeOption.placeholder, min = Config.Dialog.size.min, max = Config.Dialog.size.max},
    })
    
    if not input then return end

    local link = input[1] and input[1]:trim() or ''
    local size = tonumber(input[2])

    if link == '' then
        lib.notify({
            title = Config.Notify.NoLink.title,
            type = Config.Notify.NoLink.type,
            position = Config.Notify.NoLink.position,
            showDuration = Config.Notify.NoLink.showDuration
        })
        return
    end

    if not size or size < Config.Dialog.size.min or size > Config.Dialog.size.max then
        lib.notify({
            title = Config.Notify.InvalidSize.title,
            type = Config.Notify.InvalidSize.type,
            position = Config.Notify.InvalidSize.position,
            showDuration = Config.Notify.InvalidSize.showDuration
        })
        return
    end

    lib.notify({
        title = Config.Notify.CrosshairActive.title,
        description = Config.Notify.CrosshairActive.description,
        type = Config.Notify.CrosshairActive.type,
        position = Config.Notify.CrosshairActive.position,
        Duration = Config.Notify.CrosshairActive.Duration,
        showDuration = Config.Notify.CrosshairActive.showDuration
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

if Config.Enabled then
    RegisterCommand('crosshair', function()
        lib.showContext('lf_crosshairmenu')
    end, false)
end

lib.registerContext({
    id = 'lf_crosshairmenu',
    title = Config.Menu.title,
    options = {
        Config.Enabled and {
            title = Config.Menu.basicInfo.title,
            description = Config.Menu.basicInfo.description,
            icon = Config.Menu.basicInfo.icon,
            progress = Config.Menu.basicInfo.progress,
            colorScheme = Config.Menu.basicInfo.colorScheme,
            readOnly = true,
            metadata = Config.Watermark and {
                {label = 'Lavet af', value = 'LF Scripts'},
                {label = 'Discord', value = '.gg/h96X7M9YPc'}
            } or nil,
        } or nil,
        {
            title = Config.Menu.crosshair.title,
            description = Config.Menu.crosshair.description,
            icon = Config.Menu.crosshair.icon,
            arrow = Config.Menu.crosshair.arrow,
            onSelect = function()
                DisplayCrosshair()
            end
        },
        {
            title = Config.Menu.removeCrosshair.title,
            description = Config.Menu.removeCrosshair.description,
            icon = Config.Menu.removeCrosshair.icon,
            arrow = Config.Menu.removeCrosshair.arrow,
            onSelect = function()
                SendNUIMessage({
                    type = 'displayCrosshair',
                    link = '', 
                    size = 0
                })
                SetResourceKvp("crosshair", '') 
                previousCrosshair = nil 
                lib.notify({
                    title = Config.Notify.CrosshairRemoved.title,
                    description = Config.Notify.CrosshairRemoved.description,
                    type = Config.Notify.CrosshairRemoved.type,
                    position = Config.Notify.CrosshairRemoved.position,
                    showDuration = Config.Notify.CrosshairRemoved.showDuration
                })
            end
        },
        Config.Menu.premadeCrosshairs.enabled and {
            title = Config.Menu.premadeCrosshairs.title,
            description = Config.Menu.premadeCrosshairs.description,
            icon = Config.Menu.premadeCrosshairs.icon,
            menu = 'lf_premade_crosshair',
            arrow = Config.Menu.premadeCrosshairs.arrow
        } or nil,
    }
})


if lib and lib.registerContext then
    local context = {
        id = 'lf_premade_crosshair',
        title = Config.Premade.title,
        menu = 'lf_crosshairmenu',
        options = {}
    }

    for _, crosshair in ipairs(Config.Premade.crosshairs) do
        table.insert(context.options, {
            title = crosshair.title,
            description = crosshair.description,
            icon = crosshair.icon,
            image = crosshair.link,
            onSelect = function()
                SetPremadeCrosshair(crosshair.link, crosshair.size)
                lib.notify({
                    title = Config.Notify.CrosshairActive.title,
                    description = Config.Notify.CrosshairActive.description,
                    type = Config.Notify.CrosshairActive.type,
                    position = Config.Notify.CrosshairActive.position,
                    duration = Config.Notify.CrosshairActive.duration,
                    showDuration = Config.Notify.CrosshairActive.showDuration
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
