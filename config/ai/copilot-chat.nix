{
    plugins.copilot-chat = {
        enable = true;

        lazyLoad.settings.cmd = [
            "CopilotChat"
            "CopilotChatAgents"
            "CopilotChatLoad"
            "CopilotChatModels"
            "CopilotChatOpen"
            "CopilotChatToggle"
        ];

        settings = {
            window = {
                layout = "float";
                relative = "cursor";
                width = 1;
                height = 0.5;
                row = 1;
            };
        };
    };

    plugins.which-key.settings.spec = [
        {
            __unkeyed-1 = "<leader>a";
            group = "ai";
            icon = "";
        }
    ];

    keymaps = [
        {
            mode = [ "n" "v" ];
            key = "<leader>aa";
            action = "<cmd>CopilotChat<CR>";
            options.desc = "Toggle Copilot Chat";
        }
        {
            mode = [ "n" "v" ];
            key = "<leader>aq";
            action.__raw = ''
            function()
                local input = vim.fn.input("Quick Chat: ")
                if input ~= "" then
                    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                end
            end
            '';
            options.desc = "Quick Chat";
        }
        {
            mode = [ "n" "v" ];
            key = "<leader>ah";
            action = "<cmd>CopilotChatLoad<CR>";
            options.desc = "Load Chat History";
        }
        {
            mode = [ "n" "v" ];
            key = "<leader>ax";
            action = "<cmd>CopilotChatReset<CR>";
            options.desc = "Clear chat";
        }
    ];

    autoCmd = [
        {
            event = "BufEnter";
            pattern = "copilot-chat";
            callback.__raw = ''
            function() 
                vim.opt_local.relativenumber = false
                vim.opt_local.number = false
            end'';
        }
    ];
}
