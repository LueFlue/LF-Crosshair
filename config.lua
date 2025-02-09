Eternal = {}

Eternal.Enabled = true -- Enable or Disable the Crosshair Menu
Eternal.Watermark = true -- Just a little text when you hover over BasicInfo

Eternal.Menu = {
    title = 'Crosshair Menu',

    basicInfo = {
        enabled = true,

        title = 'Choice your completely own crosshair or use a premade crosshair. Have fun!',
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
        title = 'Remove Crosshair',
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


Eternal.Premade = {
    title = 'Premade Crosshairs',
    crosshairs = {
        {
            title = 'Crosshair 1',
            description = '',
            icon = 'fa-solid fa-crosshairs',
            link = 'https://cdn.discordapp.com/attachments/914398181775786074/1268909066692984843/layer.png?ex=6794d9a8&is=67938828&hm=2f36ea1677d27ab56b192af901aa56e3fc52d2258a8a06d74af99d8806f8917e&',
            size = 350
        },
        {
            title = 'Crosshair 2',
            description = '',
            icon = 'fa-solid fa-crosshairs',
            link = 'https://cdn.discordapp.com/attachments/914398181775786074/1242592610388803725/layer.png?ex=67955a0c&is=6794088c&hm=a5700979be51ba2bb14f5c467f8be0039f06e1e63e9008e3e7361d7c0ef3a393&',
            size = 350
        },
        {
            title = 'Crosshair 3',
            description = '',
            icon = 'fa-solid fa-crosshairs',
            link = 'https://cdn.discordapp.com/attachments/914398181775786074/1242592556194205756/Layer.png?ex=679559ff&is=6794087f&hm=9bc383a3c5f207b5187a4cd4a816397480897bbef50611da83d4846188b77d12&',
            size = 300
        },
        {
            title = 'Crosshair 4',
            description = '',
            icon = 'fa-solid fa-crosshairs',
            link = 'https://cdn.discordapp.com/attachments/914398181775786074/1044560329549553775/unknown.png?ex=679565dd&is=6794145d&hm=d2daa53855aa1b7744bf85c5a9c00cf26997904ae805e4675e739a1d99c60b58&',
            size = 50
        },
        {
            title = 'Crosshair 5',
            description = '',
            icon = 'fa-solid fa-crosshairs',
            link = 'https://cdn.discordapp.com/attachments/914398181775786074/1044559559353704458/unknown.png?ex=67956525&is=679413a5&hm=0ca000c2f5f37d4717f44f153918ed0dfc814d3b0148c868c66635b5b86de768&',
            size = 85
        },
        {
            title = 'Crosshair 6 (GIF)',
            description = '',
            icon = 'fa-solid fa-crosshairs',
            link = 'https://cdn.discordapp.com/attachments/914398181775786074/917466969802948668/rainbow.gif?ex=67951eb3&is=6793cd33&hm=598cf83654bbf72749615a13ed61e4f5372777ab47867bb6b4e7d873c5df6deb&',
            size = 150
        },
    }
}


Eternal.Dialog = {
    title = 'Crosshair Menu',

    size = {
        min = 0,
        max = 500,
    },

    link = {
        title = 'URL (Image URL)',
        description = 'URL to your crosshair',
        placeholder = 'Fx: https://cdn.discordapp.com/',
    },

    sizeOption = {
        title = 'Size',
        description = 'Choice a size',
        placeholder = 'Example: 150',
    }
}


Eternal.Notify = {
    NoLink = {
        title = 'You need a url',
        type = 'error',
        position = 'center-right',
        showDuration = false,
    },
    
    InvalidSize = {
        title = 'Size is invaild',
        type = 'error',
        position = 'center-right',
        showDuration = false
    },

    CrosshairActive = {
        title = 'Crosshair Active!',
        description = 'Warning: This can make you lag a little bit.',
        type = 'info',
        position = 'center-right',
        duration = 5000,
        showDuration = false
    },

    CrosshairRemoved = {
        title = 'Crosshair Removed',
        description = '',
        type = 'success',
        position = 'center-right',
        showDuration = false
    }
}
