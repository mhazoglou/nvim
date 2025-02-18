-- return {
--     'goolord/alpha-nvim',
--     config = function()
--         local alpha = require("alpha")
--         local dashboard = require("alpha.themes.dashboard")
--         -- Set header
--         dashboard.section.header.val = {
--             "                                                     ",
--             "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--             "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--             "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--             "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--             "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--             "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--             "                                                     ",
--         }
--
--         -- Set menu
--         dashboard.section.buttons.val = {
--             dashboard.button( "e", "   > New file" , ":ene <BAR> startinsert <CR>"),
--             dashboard.button( "f", "󰱼   > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
--             dashboard.button( "r", "   > Recent"   , ":Telescope oldfiles<CR>"),
--             dashboard.button( "s", "   > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
--             dashboard.button( "q", "󰩈   > Quit NVIM", ":qa<CR>"),
--         }
--
--         -- Set footer
--         --   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--         --   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--         --   ```init.lua
--         --   return require('packer').startup(function()
--         --       use 'wbthomason/packer.nvim'
--         --       use {
--         --           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--         --           requires = {'BlakeJC94/alpha-nvim-fortune'},
--         --           config = function() require("config.alpha") end
--         --       }
--         --   end)
--         --   ```
--         -- local fortune = require("alpha.fortune")
--         -- dashboard.section.footer.val = fortune()
--         --
--         -- Send config to alpha
--         alpha.setup(dashboard.config)
--
--         -- Disable folding on alpha buffer
--         vim.cmd([[
--             autocmd FileType alpha setlocal nofoldenable
--         ]])
--     end
-- }
local coolLines = {
    [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    [[    ███╗   ███╗ █████╗ ██╗  ██╗███████╗   ]],
    [[    ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝   ]],
    [[    ██╔████╔██║███████║█████╔╝ █████╗     ]],
    [[    ██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝     ]],
    [[    ██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗   ]],
    [[    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ]],
    [[      ██████╗ ██████╗  ██████╗ ██╗        ]],
    [[     ██╔════╝██╔═══██╗██╔═══██╗██║        ]],
    [[     ██║     ██║   ██║██║   ██║██║        ]],
    [[     ██║     ██║   ██║██║   ██║██║        ]],
    [[     ╚██████╗╚██████╔╝╚██████╔╝███████╗   ]],
    [[      ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝   ]],
    [[███████╗████████╗██╗   ██╗███████╗███████╗]],
    [[██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝]],
    [[███████╗   ██║   ██║   ██║█████╗  █████╗  ]],
    [[╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  ]],
    [[███████║   ██║   ╚██████╔╝██║     ██║     ]],
    [[╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     ]],
}

local solveLines = {
    [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    [[╔═╗┬┬─┐┌─┐┌┬┐  ┌─┐┌─┐┬ ┬  ┬┌─┐  ┌┬┐┬ ┬┌─┐  ┌─┐┬─┐┌─┐┌┐ ┬  ┌─┐┌┬┐   ]],
    [[╠╣ │├┬┘└─┐ │   └─┐│ ││ └┐┌┘├┤    │ ├─┤├┤   ├─┘├┬┘│ │├┴┐│  ├┤ │││   ]],
    [[╚  ┴┴└─└─┘ ┴┘  └─┘└─┘┴─┘└┘ └─┘   ┴ ┴ ┴└─┘  ┴  ┴└─└─┘└─┘┴─┘└─┘┴ ┴ o ]],
    [[      ╔╦╗┬ ┬┌─┐┌┐┌  ┬ ┬┬─┐┬┌┬┐┌─┐  ┌┬┐┬ ┬┌─┐  ┌─┐┌─┐┌┬┐┌─┐         ]],
    [[       ║ ├─┤├┤ │││  │││├┬┘│ │ ├┤    │ ├─┤├┤   │  │ │ ││├┤          ]],
    [[       ╩ ┴ ┴└─┘┘└┘  └┴┘┴└─┴ ┴ └─┘   ┴ ┴ ┴└─┘  └─┘└─┘─┴┘└─┘         ]],
    [[                                                     - John Johnson]],
}

local humourLines = {
    [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    [[╔═╗┌─┐┌┬┐┌─┐  ┬┌─┐  ┬  ┬┬┌─┌─┐  ┬ ┬┬ ┬┌┬┐┌─┐┬─┐                           ]],
    [[║  │ │ ││├┤   │└─┐  │  │├┴┐├┤   ├─┤│ │││││ │├┬┘                           ]],
    [[╚═╝└─┘─┴┘└─┘  ┴└─┘  ┴─┘┴┴ ┴└─┘  ┴ ┴└─┘┴ ┴└─┘┴└─o                          ]],
    [[╦ ╦┬ ┬┌─┐┌┐┌  ┬ ┬┌─┐┬ ┬  ┬ ┬┌─┐┬  ┬┌─┐  ┌┬┐┌─┐  ┌─┐─┐ ┬┌─┐┬  ┌─┐┬┌┐┌  ┬┌┬┐]],
    [[║║║├─┤├┤ │││  └┬┘│ ││ │  ├─┤├─┤└┐┌┘├┤    │ │ │  ├┤ ┌┴┬┘├─┘│  ├─┤││││  │ │ ]],
    [[╚╩╝┴ ┴└─┘┘└┘   ┴ └─┘└─┘  ┴ ┴┴ ┴ └┘ └─┘   ┴ └─┘  └─┘┴ └─┴  ┴─┘┴ ┴┴┘└┘  ┴ ┴┘]],
    [[                                                     ┬┌┬┐  ┬┌─┐  ┌┐ ┌─┐┌┬┐]],
    [[                                                     │ │   │└─┐  ├┴┐├─┤ ││]],
    [[                                                     ┴ ┴   ┴└─┘  └─┘┴ ┴─┴┘]],
    [[                                                              - Cory House]],
}

local bugLines = {
    [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    [[  _____   _                          _                 _                             ]],
    [[ |_   _| | |_    ___   _ _   ___    (_)  ___    __ _  | | __ __ __  __ _   _  _   ___]],
    [[   | |   | ' \  / -_) | '_| / -_)   | | (_-<   / _` | | | \ V  V / / _` | | || | (_-<]],
    [[   |_|   |_||_| \___| |_|   \___|   |_| /__/   \__,_| |_|  \_/\_/  \__,_|  \_, | /__/]],
    [[                                                                           |__/      ]],
    [[                                                   _                                 ]],
    [[  ___   _ _    ___     _ __    ___   _ _   ___    | |__   _  _   __ _                ]],
    [[ / _ \ | ' \  / -_)   | '  \  / _ \ | '_| / -_)   | '_ \ | || | / _` |               ]],
    [[ \___/ |_||_| \___|   |_|_|_| \___/ |_|   \___|   |_.__/  \_,_| \__, |               ]],
    [[                                                                |___/                ]],
    [[  _              __   _                                                              ]],
    [[ | |_   ___     / _| (_) __ __                                                       ]],
    [[ |  _| / _ \   |  _| | | \ \ /  _                                                    ]],
    [[  \__| \___/   |_|   |_| /_\_\ (_)                                     - Ellen Ullman]],
}

local fixLines = {
    [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    [[    ┌─┐┬─┐ ┬  ┌┬┐┬ ┬┌─┐  ┌─┐┌─┐┬ ┬┌─┐┌─┐      ]],
    [[    ├┤ │┌┴┬┘   │ ├─┤├┤   │  ├─┤│ │└─┐├┤       ]],
    [[    └  ┴┴ └─   ┴ ┴ ┴└─┘  └─┘┴ ┴└─┘└─┘└─┘┘     ]],
    [[╔╗╔╔═╗╔╦╗  ╔╦╗╦ ╦╔═╗  ╔═╗╦ ╦╔╦╗╔═╗╔╦╗╔═╗╔╦╗╔═╗]],
    [[║║║║ ║ ║    ║ ╠═╣║╣   ╚═╗╚╦╝║║║╠═╝ ║ ║ ║║║║╚═╗]],
    [[╝╚╝╚═╝ ╩    ╩ ╩ ╩╚═╝  ╚═╝ ╩ ╩ ╩╩   ╩ ╚═╝╩ ╩╚═╝]],
    [[                              - Steve Maguire ]],
}

local processLines = {
    [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    [[╔╦╗╦ ╦╔═╗  ╔═╗╦═╗╔═╗╔═╗╔╦╗╦╦  ╦╔═╗  ╔═╗╦═╗╔═╗╔═╗╔═╗╔═╗╔═╗]],
    [[ ║ ╠═╣║╣   ║  ╠╦╝║╣ ╠═╣ ║ ║╚╗╔╝║╣   ╠═╝╠╦╝║ ║║  ║╣ ╚═╗╚═╗]],
    [[ ╩ ╩ ╩╚═╝  ╚═╝╩╚═╚═╝╩ ╩ ╩ ╩ ╚╝ ╚═╝  ╩  ╩╚═╚═╝╚═╝╚═╝╚═╝╚═╝]],
    [[This is Amazing!]],
    [[This is difficult]],
    [[This is shit]],
    [[I am shit]],
    [[This might be OK]],
    [[This is Amazing!]],
}

local function lineColor(lines, popStart, popEnd)
    local out = {}
    for i, line in ipairs(lines) do
        local hi = "StartLogo" .. i
        if i > popStart and i <= popEnd then
            hi = "StartLogoPop" .. i - popStart
        elseif i > popStart then
            hi = "StartLogo" .. i - popStart
        else
            hi = "StartLogo" .. i
        end
        table.insert(out, { hi = hi, line = line })
    end
    return out
end

local headers = {
    lineColor(coolLines, 12, 18),
    lineColor(solveLines, 9, 12),
    lineColor(humourLines, 12, 15),
    lineColor(bugLines, 11, 16),
    lineColor(processLines, 6, 9),
    lineColor(fixLines, 9, 12),
}

local function header_chars()
    math.randomseed(os.time())
    return headers[math.random(#headers)]
end

-- Map over the headers, setting a different color for each line.
-- This is done by setting the Highligh to StartLogoN, where N is the row index.
-- Define StartLogo1..StartLogoN to get a nice gradient.
local function header_color()
    local lines = {}
    for _, lineConfig in pairs(header_chars()) do
        local hi = lineConfig.hi
        local line_chars = lineConfig.line
        local line = {
            type = "text",
            val = line_chars,
            opts = {
                hl = hi,
                shrink_margin = false,
                position = "center",
            },
        }
        table.insert(lines, line)
    end

    local output = {
        type = "group",
        val = lines,
        opts = { position = "center" },
    }

    return output
end

local function configure()
    local theme = require("alpha.themes.theta")
    local themeconfig = theme.config
    local dashboard = require("alpha.themes.dashboard")
    local buttons = {
        type = "group",
        val = {
            { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
            { type = "padding", val = 1 },
            dashboard.button("e", "  New file", "<cmd>ene<CR>"),
            dashboard.button("n", "󰙅  File tree", "<cmd>Neotree<CR>"),
            dashboard.button("SPC ff", "  Find file"),
            dashboard.button("SPC fg", "  Find text"),
            dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy sync<CR>"),
            dashboard.button("t", "  Install language tools", "<cmd>Mason<CR>"),
            dashboard.button("q", "󰩈  Quit", "<cmd>qa<CR>"),
        },
        position = "center",
    }

    themeconfig.layout[2] = header_color()
    themeconfig.layout[6] = buttons

    return themeconfig
end

return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("alpha").setup(configure())
    end,
}
