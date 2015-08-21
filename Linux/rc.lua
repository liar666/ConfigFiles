-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- Widgets library
require("vicious")

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
-- beautiful.init("/home/guigui/.config/awesome/theme.lua")
-- beautiful.init("/usr/local/share/awesome/themes/zenburn/theme.lua")
-- beautiful.init("/usr/local/share/awesome/themes/sky/theme.lua")
beautiful.init("/usr/share/awesome/themes/default/theme.lua")

-- GM: Load script that launches startup applications
os.execute("source ~/.xsession");
--os.execute("source ~/Softs/run_ssh_add");

-- This is used later as the default terminal and editor to run.
terminal = "uxterm"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
xlockcmd = "/home/guillaume/Softs/run_screensaver"
minBattery = .2

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.max,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
   tags[s] = awful.tag({ "Chat-" .. s, "W1-" .. s, "W2-" .. s, "W3-" .. s, "Mail-" .. s, "Web-" .. s, "Mumule-" .. s }, s, layouts[2])
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Terminal", terminal },
                                    { "XChat", "xchat" },
                                    { "Nautilus", "nautilus" },
                                    { "XXXTerm", "xxxterm" },
                                    { "Firefox", "firefox" },
                                    { "Chromium", "~/.mychromium" },
                                    { "Midori", "~/.mymidori" },
                                    { "Thunderbird", "thunderbird" },
                                    { "Audacious", "audacious2" },
                                    { "aMule", "amule" },
                                    { "KTorrent", "ktorrent" },
                                    { "Xlock", "xlock" }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

xchatbox = widget({ type="imagebox", name="icon", align=align })
xchatbox.image = image("/usr/share/xemacs21/xemacs-packages/etc/xwem/mini-xchat.xpm")
xchatbox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("xchat") end)))

nautilusbox = widget({ type="imagebox", name="icon", align=align })
nautilusbox.image = image("/usr/share/icons/hicolor/24x24/apps/nautilus.png")
nautilusbox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("nautilus") end)))

skypebox = widget({ type="imagebox", name="icon", align=align })
skypebox.image = image("/usr/share/icons/skype.png")
skypebox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("skype") end)))

midoribox = widget({ type="imagebox", name="icon", align=align })
midoribox.image = image("/usr/share/icons/hicolor/24x24/apps/midori.png")
midoribox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("/home/guillaume/.mymidori") end)))

--xxxtermbox = widget({ type="imagebox", name="icon", align=align })
--xxxtermbox.image = image("/usr/local/share/icons/hicolor/24x24/apps/gnome-panel-fish.png")
--xxxtermbox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("xxxterm") end)))

firefoxbox = widget({ type="imagebox", name="icon", align=align })
firefoxbox.image = image("/usr/lib/firefox/browser/chrome/icons/default/default32.png")
firefoxbox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("firefox") end)))

eclipsebox = widget({ type="imagebox", name="icon", align=align })
eclipsebox.image = image("/usr/share/app-install/icons/eclipse.png")
eclipsebox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("/home/guillaume/Softs/eclipse/eclipse") end)))

chromiumbox = widget({ type="imagebox", name="icon", align=align })
chromiumbox.image = image("/usr/share/icons/hicolor/24x24/apps/chromium-browser.png")
chromiumbox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("/home/guillaume/.mychromium") end)))

thunderbirdbox = widget({ type="imagebox", name="icon", align=align })
thunderbirdbox.image = image("/usr/lib/thunderbird/chrome/icons/default/default32.png")
thunderbirdbox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("thunderbird") end)))

audaciousbox = widget({ type="imagebox", name="icon", align=align })
audaciousbox.image = image("/usr/share/icons/hicolor/48x48/apps/audacious.png")
audaciousbox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("audacious") end)))

--amulebox = widget({ type="imagebox", name="icon", align=align })
--amulebox.image = image("/usr/local/share/pixmaps/amule.xpm")
--amulebox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("amule") end)))

--ktorrentbox = widget({ type="imagebox", name="icon", align=align })
--ktorrentbox.image = image("/usr/local/share/apps/ktorrent/www/coldmilk/icon.png")
--ktorrentbox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn("ktorrent") end)))

xlockbox = widget({ type="imagebox", name="icon", align=align })
xlockbox.image = image("/usr/share/xemacs21/xemacs-packages/etc/gnus/lock.xpm")
xlockbox:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(xlockcmd) end)))

------------------------------------ WIDGETS START
mycpugraph0 = awful.widget.graph()
mycpugraph0:set_width(25)
mycpugraph0:set_background_color('#000000')
mycpugraph0:set_color('#F01010')
--
mycpugraph1 = awful.widget.graph()
mycpugraph1:set_width(25)
mycpugraph1:set_background_color('#000000')
mycpugraph1:set_color('#D03030')
--
mycpugraph2 = awful.widget.graph()
mycpugraph2:set_width(25)
mycpugraph2:set_background_color('#000000')
mycpugraph2:set_color('#E02020')
--
mycpugraph3 = awful.widget.graph()
mycpugraph3:set_width(25)
mycpugraph3:set_background_color('#000000')
mycpugraph3:set_color('#C04040')

mybatprogressbar = awful.widget.progressbar()
mybatprogressbar:set_width(10)
--mybatprogressbar:set_height(10)
mybatprogressbar:set_vertical(true)
mybatprogressbar:set_background_color('#000000')
mybatprogressbar:set_color('#F0F0F0')
mybatprogressbar:set_gradient_colors({ '#444444', '#DDDDDD', '#EEEEEE' })
-- TODO : mybatprogressbar:set_value(<call func>)

mynetgraphin = awful.widget.graph()
mynetgraphin:set_width(35)
mynetgraphin:set_background_color('#000000')
mynetgraphin:set_color('#00D000')
--
mynetgraphout = awful.widget.graph()
mynetgraphout:set_width(35)
mynetgraphout:set_background_color('#000000')
mynetgraphout:set_color('#00B000')

myramgraph = awful.widget.graph()
myramgraph:set_width(35)
myramgraph:set_background_color('#000000')
myramgraph:set_color('#0000F0')


--myhomefsprogressbar = awful.widget.progressbar()
--myhomefsprogressbar:set_width(50)
----myhomefsprogressbar:set_height(10)
--myhomefsprogressbar:set_vertical(false)
--myhomefsprogressbar:set_background_color('#000000')
--myhomefsprogressbar:set_color('#DDDDDD')
--myhomefsprogressbar:set_gradient_colors({ '#AECF96', '#88A175', '#FF5656' })
---- TODO : myhomefsprogressbar:set_value(<call func>)

myrootfsprogressbar = awful.widget.progressbar()
myrootfsprogressbar:set_width(10)
--myrootfsprogressbar:set_height(10)
myrootfsprogressbar:set_vertical(true)
myrootfsprogressbar:set_background_color('#000000')
myrootfsprogressbar:set_color('#AEAEA0')
myrootfsprogressbar:set_gradient_colors({ '#FFFFFE', '#FFA175', '#000000' })
-- TODO : myrootfsprogressbar:set_value(<call func>)

-- GM: To get the output of a shell command
function os.capture(cmd2Run, asNumber)
  local f = assert(io.popen(cmd2Run, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if asNumber 
  then 
     return tonumber(s)
  end
  return s
end

-- Initializations
cpu0Last = os.capture("~/Softs/getCPUpercent 0", true);
cpu1Last = os.capture("~/Softs/getCPUpercent 1", true);
cpu2Last = os.capture("~/Softs/getCPUpercent 2", true);
cpu3Last = os.capture("~/Softs/getCPUpercent 3", true);
netinLast = os.capture("~/Softs/getNETpercent in", true);
netoutLast = os.capture("~/Softs/getNETpercent out", true);
rootfs = os.capture("~/Softs/getFSpercent root");
myrootfsprogressbar:set_value(rootfs);
bat = os.capture("~/Softs/getBATpercent");
mybatprogressbar:set_value(bat);

-- Updates of the values
myhighspeedtimer = timer({ timeout = 1 })
myhighspeedtimer:add_signal("timeout", function()

    cpu0 = os.capture("~/Softs/getCPUpercent 0", true);
    mycpugraph0:add_value(cpu0-cpu0Last);
    cpu0Last=cpu0
    cpu1 = os.capture("~/Softs/getCPUpercent 1", true);
    mycpugraph1:add_value(cpu1-cpu1Last);
    cpu1Last=cpu1
    cpu2 = os.capture("~/Softs/getCPUpercent 2", true);
    mycpugraph2:add_value(cpu2-cpu2Last);
    cpu2Last=cpu2
    cpu3 = os.capture("~/Softs/getCPUpercent 3", true);
    mycpugraph3:add_value(cpu3-cpu3Last);
    cpu3Last=cpu3

    ram = os.capture("~/Softs/getRAMpercent", true);
    myramgraph:add_value(ram);

    netin = os.capture("~/Softs/getNETpercent in", true);
    mynetgraphin:add_value(netin-netinLast);
    netinLast = netin;
    netout = os.capture("~/Softs/getNETpercent out", true);
    mynetgraphout:add_value(netout-netoutLast);
    netoutLast = netout;

--    print("******", cpu0, " ", cpu1, " ", cpu2, " ", cpu3, " ", ram, " ")
--    print("******~", (netin-netinLast), " ", (netout-netoutLast))
end)
myhighspeedtimer:start()

mylowspeedtimer = timer({ timeout = 30 })
mylowspeedtimer:add_signal("timeout", function()

    bat = os.capture("~/Softs/getBATpercent", true);
    if bat < minBattery
    then 
       mybatprogressbar:set_background_color('#FFFFFF')
       mybatprogressbar:set_color('#FF0000')
       mybatprogressbar:set_gradient_colors({ '#FF0000', '#FF0000', '#FF0000' })
    else
       mybatprogressbar:set_background_color('#000000')
       mybatprogressbar:set_color('#F0F0F0')
       mybatprogressbar:set_gradient_colors({ '#444444', '#DDDDDD', '#EEEEEE' })
    end
    mybatprogressbar:set_value(bat);

--    homefs = os.capture("~/Softs/getFSpercent home");
--    myhomefsprogressbar:set_value(homefs);
    rootfs = os.capture("~/Softs/getFSpercent root");
    myrootfsprogressbar:set_value(rootfs);
--    print("******", homefs, ", ", rootfs, ", ", bat)
end)
mylowspeedtimer:start()

------------------------------------ WIDGETS END


-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey, "Control" }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock,
-- GM clickable icons for applications
	xlockbox,
	ktorrentbox,
	amulebox,
	audaciousbox,
	thunderbirdbox,
	chromiumbox,
	firefoxbox,
	midoribox,
	xxxtermbox,
	nautilusbox,
	skypebox,
	xchatbox,
	eclipsebox,
-- GM widgets for mem/CPU/net/fs/batt
	myrootfsprogressbar.widget,
--	myhomefsprogressbar.widget,
	myramgraph.widget,
	mynetgraphout.widget,
	mynetgraphin.widget,
	mybatprogressbar.widget,
	mycpugraph3.widget,
	mycpugraph2.widget,
	mycpugraph1.widget,
	mycpugraph0.widget,
        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey, "Control" }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey, "Control" }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey, "Control" }, "Escape", awful.tag.history.restore),

    awful.key({ modkey, "Control" }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
--    awful.key({ modkey, }, "k",
--        function ()
--            awful.client.focus.byidx(-1)
--            if client.focus then client.focus:raise() end
--        end),
--    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
--    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
--    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
--    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
--    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
--    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
awful.key({ modkey, "Control" }, "Tab",
    function ()
        -- awful.client.focus.history.previous()
        awful.client.focus.byidx(-1)
        if client.focus then
            client.focus:raise()
        end
    end),
awful.key({ modkey, "Control", "Shift" }, "Tab",
    function ()
        -- awful.client.focus.history.previous()
        awful.client.focus.byidx(1)
        if client.focus then
            client.focus:raise()
        end
    end),


    -- Standard program
    awful.key({ modkey, "Control" }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Control" }, "q", awesome.quit),

    awful.key({ modkey, "Control" }, "KP_8",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey, "Control" }, "KP_2",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",        function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",        function () awful.tag.incnmaster(-1)      end),
--    awful.key({ modkey, "Control" }, "h",        function () awful.tag.incncol( 1)         end),
--    awful.key({ modkey, "Control" }, "l",        function () awful.tag.incncol(-1)         end),
    awful.key({ modkey, "Control" }, "l",        function () awful.util.spawn(xlockcmd) end),
    awful.key({ modkey, "Control"   }, "space",  function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Control", "Shift" }, "space", function () awful.layout.inc(layouts, -1) end),

    -- Prompt
    awful.key({ modkey, "Control" },            "x",     function () mypromptbox[mouse.screen]:run() end)
--,

--    awful.key({ modkey }, "x",
--             function ()
--                  awful.prompt.run({ prompt = "Run Lua code: " },
--                  mypromptbox[mouse.screen].widget,
--                  awful.util.eval, nil,
--                  awful.util.getdir("cache") .. "/history_eval")
--              end)
)

clientkeys = awful.util.table.join(
--    awful.key({ modkey,           }, "f",     function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Control"   }, "k",     function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "f",       awful.client.floating.toggle                     ),
    awful.key({ modkey, "Shift" }, "Return",    function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",       awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",       function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",       function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey, "Control" }, "i",       function (c) c.minimized = not c.minimized    end),
    awful.key({ modkey, "Control" }, "a",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey, "Control" }, 1, awful.mouse.client.move),
    awful.button({ modkey, "Control" }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
secondScreen = screen.count();
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { name = "Weka" },
      properties = { maximized_horizontal = true, maximized_vertical = true, size_hints_honor = false } },
    { rule = { name = "Weka Explorer" },
      properties = { maximized_horizontal = true, maximized_vertical = true, size_hints_honor = false } },
    { rule = { name = "Weka GUI Chooser" },
      properties = { maximized_horizontal = true, maximized_vertical = true, size_hints_honor = false } },
--    { rule = { class = "Weka" },
--      properties = { maximized_horizontal = true, maximized_vertical = true, size_hints_honor = false } },
--    { rule = { class = "Weka Explorer" },
--      properties = { maximized_horizontal = true, maximized_vertical = true, size_hints_honor = false } },
--    { rule = { class = "Weka GUI Chooser" },
--      properties = { maximized_horizontal = true, maximized_vertical = true, size_hints_honor = false } },
    { rule = { class = "QEMU" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    { rule = { class = "Qemu" },
      properties = { floating = true } },
    { rule = { name = "Xpdf: Find" },
      properties = { floating = true } },
    { rule = { class = "Xpdf" },
      properties = { maximized_horizontal = true, maximized_vertical = true } },
    { rule = { class = "GQview" },
      properties = { maximized_horizontal = true, maximized_vertical = true } },
-- GM
    { rule = { class = "Eclipse" },
       properties = { tag = tags[1][2] } }, -- "Work1"
    { rule = { name = "Java" },
       properties = { tag = tags[1][2] } }, -- "Work1"
    { rule = { class = "Xchat" },
       properties = { tag = tags[1][1] } }, -- "Chat"
    { rule = { class = "Skype" },
       properties = { tag = tags[1][1] } }, -- "Chat"
    { rule = { class = "Audacious" },
       properties = { tag = tags[1][4] } }, -- Work3
    { rule = { class = "Thunderbird" },
       properties = { tag = tags[1][5] } }, -- Mail
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][6] } }, -- Web
    { rule = { class = "Chromium" },
      properties = { tag = tags[1][7] } }, -- Web
    { rule = { class = "Midori" },
      properties = { tag = tags[1][7] } }, -- Web
    { rule = { class = "Xxxterm" },
      properties = { tag = tags[1][6] } }, -- Web
    { rule = { class = "Amule" },
      properties = { tag = tags[1][7] } }, -- Mumule
    { rule = { class = "Ktorrent" },
      properties = { tag = tags[1][7] } }, -- Mumule
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
