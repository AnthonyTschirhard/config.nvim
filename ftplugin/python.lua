-- load coverage
local coverage = require("coverage")

coverage.load(
    function()
        coverage.show()
    end
)