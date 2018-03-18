local assdraw = require 'mp.assdraw'
local msg = require 'mp.msg'
local opt = require 'mp.options'
local utils = require 'mp.utils'

--[[
        Simple script to expose a command to write a line to a file.
        Example bind:
        v script-message write-to-file "/home/yama/tmp/luatest" "Added $title to file"

        TODO:
        - Add delete option
        - Check for file and create it in default directory if it doesn't exist
]]--

local SCRIPT_COMMAND_NAME = 'write-to-file'

function script_command_handler(filename, input_string)
    local file = io.open(filename, 'a+')

    if file == nil then
        msg.error('Unable to open file for appending: ' , filename)
        return
    end

    file:seek("set")
    for l in file:lines() do
        if l == input_string then
            return
        end
    end

    file:seek("end")
    file:write(input_string , '\n')
    file:close()
end


mp.register_script_message(SCRIPT_COMMAND_NAME, script_command_handler)
