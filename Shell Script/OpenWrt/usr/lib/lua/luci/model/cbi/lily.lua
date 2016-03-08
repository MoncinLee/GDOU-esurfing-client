require("luci.sys")

m = Map("lily", translate("Lily"), translate("大风从东吹到西，从北刮到南，无视黑夜和黎明 你所说的曙光究竟是什么意思"))

s = m:section(TypedSection, "login", "")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enable", translate("Enable"))
name = s:option(Value, "username", translate("Username"))
name.rmempty  = false
pass = s:option(Value, "password", translate("Password"))
pass.password = true
pass.rmempty  = false
nasip = s:option(Value, "nasip", translate("wlanacip"))
nasip.datatype = "ipaddr"
nasip.rmempty  = false
phone = s:option(Flag, "phone", translate("第二终端"),translate("模拟手机客户端拨号"))

local apply = luci.http.formvalue("cbi.apply")
if apply then
    io.popen(" /etc/init.d/lily restart")
end

return m


