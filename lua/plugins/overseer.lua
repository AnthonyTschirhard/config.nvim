local overseer = require('overseer')

overseer.setup()

-- coverage test
overseer.register_template({
    name = "Coverage Test",
    builder = function()
        return {
            cmd = { 'coverage' },
            args = { 'run', '--branch', '--omit=./test/*', '-m', 'unittest', 'discover', '-s', './test', '-p', 'test_*.py' }
        }
    end,
    desc = "Update coverage analysis"
})

overseer.register_template({
    name = "SAM - Build",
    builder = function()
        return {
            cmd = { 'sam' },
            args = { 'build' }
        }
    end,
    desc = "Build the sam project"
})

overseer.register_template({
    name = "SAM - Validate",
    builder = function()
        return {
            cmd = { 'sam' },
            args = { 'validate' }
        }
    end,
    desc = "Validates the sam template"
})

overseer.register_template({
    name = "SAM - Deploy",
    builder = function()
        return {
            cmd = { 'sam' },
            args = { 'deploy', '--no-confirm-changeset', '--no-fail-on-empty-changeset' }
        }
    end
})

vim.keymap.set({ 'n' }, '<leader>rr', ':OverseerRun<CR>')
vim.keymap.set({ 'n' }, '<leader>rt', ':OverseerToggle<CR>')

