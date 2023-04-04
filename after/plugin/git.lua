local gitlinker = require("gitlinker")

local config = {

}

gitlinker.setup(config)

local gitconflict = require('git-conflict')

gitconflict.setup()
