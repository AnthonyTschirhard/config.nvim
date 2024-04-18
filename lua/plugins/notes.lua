function new_notes()
    vim.ui.input({
            prompt = 'New note: ',
            default = os.date('%Y%m%d.md')
        },
        function(input)
            if input == nil then
                return
            end
            vim.cmd("edit ~/Sources/notes/quick_notes/" .. input)
        end
    )
end

vim.keymap.set("n", "<leader>nn", new_notes)

