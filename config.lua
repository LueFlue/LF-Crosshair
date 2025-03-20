Config = {}

Config.Enabled = true -- Enable eller Disable Crosshair Menuen
Config.Watermark = true -- Watermark ved BasicInfo

Config.Menu = {
    title = 'Crosshair Menu',

    basicInfo = {
        enabled = true,

        title = 'Vælg dit helt eget crosshair eller tag et premade!',
        description = '',
        icon = 'fa-solid fa-circle-info',
        progress = 100,
        colorScheme = 'blue'
    },

    crosshair = {
        title = 'Crosshair',
        description = '',
        icon = 'fa-solid fa-crosshairs',
        arrow = false,
    },

    removeCrosshair = {
        title = 'Fjern Crosshair',
        description = '',
        icon = 'fa-solid fa-trash',
        arrow = false,
    },

    premadeCrosshairs = {
        enabled = true,
        
        title = 'Premade Crosshairs',
        description = '',
        icon = 'fa-solid fa-database',
        arrow = true,
    }
}


Config.Premade = {
    title = 'Premade Crosshairs',
    crosshairs = {
        {
            title = 'Crosshair 1',
            description = '',
            icon = 'fa-solid fa-crosshairs',
            link = 'https://cdn.discordapp.com/attachments/1340103339454763018/1340103793211342919/layer.png?ex=67b1246a&is=67afd2ea&hm=d13631e0e102ba728e442da8e4066ff82ecb6328fc5ae1a9695dd0efab501e85&',
            size = 350
        },
        {
            title = 'Crosshair 2',
            description = '',
            icon = 'fa-solid fa-crosshairs',
            link = 'https://cdn.discordapp.com/attachments/1340103339454763018/1340103981837582356/Layer2.png?ex=67b12497&is=67afd317&hm=9a6cba07bc6b522d4441eeba80e1e1b3c3fe25d13a59c59fb00ee9dce447ab31&',
            size = 200
        },
        {
            title = 'Crosshair 3',
            description = '',
            icon = 'fa-solid fa-crosshairs',
            link = 'https://cdn.discordapp.com/attachments/1340103339454763018/1340104313397313648/white_crossair.png?ex=67b124e6&is=67afd366&hm=41866ef3af677129310e73caf326bba4c5022585e334ad314383578c90aff0e8&',
            size = 70
        },
        {
            title = 'Crosshair 4',
            description = '',
            icon = 'fa-solid fa-crosshairs',
            link = 'https://cdn.discordapp.com/attachments/1340103339454763018/1340104586534322247/unknown.png?ex=67b12527&is=67afd3a7&hm=786820ada9601b719559bab83f68d23d24644269418444ebc9ff7573de63f973&',
            size = 75
        },
        {
            title = 'Crosshair 5 (GIF)',
            description = '',
            icon = 'fa-solid fa-crosshairs',
            link = 'https://cdn.discordapp.com/attachments/1340103339454763018/1340104830571778148/rainbow.gif?ex=67b12561&is=67afd3e1&hm=91baa307b5a679ed9f11cc8db5339d0521037beead7677cd5e464c4e06ea556c&',
            size = 75
        },
    }
}


Config.Dialog = {
    title = 'Crosshair Menu',

    size = {
        min = 0,
        max = 1000,
    },

    link = {
        title = 'Link (Billed URL)',
        description = 'Link til dit crosshair (kan forårsage lidt lag)',
        placeholder = 'Fx: https://media.discordapp.net/',
    },

    sizeOption = {
        title = 'Størrelse',
        description = 'Vælg en størrelse',
        placeholder = 'Fx: 150',
    }
}


Config.Notify = {
    NoLink = {
        title = 'Du skal have et link',
        type = 'error',
        position = 'center-right',
        showDuration = false,
    },
    
    InvalidSize = {
        title = 'Størrelsen skal være "MIN 0" & "MAX 1000"',
        type = 'error',
        position = 'center-right',
        showDuration = false
    },

    CrosshairActive = {
        title = 'Crosshair aktiveret!',
        description = 'Bemærk: Dette kan forårsage lidt lag.',
        type = 'info',
        position = 'center-right',
        duration = 5000,
        showDuration = false
    },

    CrosshairRemoved = {
        title = 'Crosshair Fjernet',
        description = '',
        type = 'success',
        position = 'center-right',
        showDuration = false
    }
}
