local colors = require("sbar_setup.colors")

local cpu = sbar.add("item", "cpu", {
    position = "right",
    icon = {
        string = "􀧓",
        font = {
            style = "Regular",
            size = 15.0,
        }
    },
    label = {
        string = "0%",
        font = {
            family = "SF Pro",
            style = "Regular",
            size = 15.0,
        }
    },
    background = {
        color = colors.itemBGColor,
    },
    update_freq = 2,
})

local function update()
    -- Get number of CPU threads (cores)
    local core_count = tonumber(io.popen("sysctl -n machdep.cpu.thread_count"):read("*a"):match("%d+"))

    -- Get full CPU usage info from ps
    local cpu_info = io.popen("ps -eo pcpu,user"):read("*a")

    -- Get current user
    local user = os.getenv("USER")

    -- Initialize sums
    local sys_sum, user_sum = 0, 0

    -- Process each line
    for line in cpu_info:gmatch("[^\r\n]+") do
        local usage, owner = line:match("([%d%.]+)%s+(%S+)")
        if usage and owner and owner ~= "USER" then -- skip header
            local usage_num = tonumber(usage)
            if usage_num then
                if owner == user then
                    user_sum = user_sum + usage_num
                else
                    sys_sum = sys_sum + usage_num
                end
            end
        end
    end

    -- Normalize by core count
    local cpu_sys = sys_sum / (100.0 * core_count)
    local cpu_user = user_sum / (100.0 * core_count)

    -- Compute total percent
    local cpu_percent = math.floor((cpu_sys + cpu_user) * 100 + 0.5)

    cpu:set({
        label = {
            string = cpu_percent .. "%",
        }
    })
end

cpu:subscribe("routine", update)
cpu:subscribe("forced", update)
