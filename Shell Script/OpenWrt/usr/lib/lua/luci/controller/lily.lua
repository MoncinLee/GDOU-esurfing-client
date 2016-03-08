require("luci.sys")
module("luci.controller.lily", package.seeall)

function index()
        entry({"admin", "network", "lily"}, cbi("lily"), _("Lily"), 100)
        end
