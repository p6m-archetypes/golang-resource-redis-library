-- golang-resource-redis-library main module.
-- Renders Redis client setup into the service's cache package.
--
-- The calling archetype is responsible for adding the corresponding
-- Go module dependency:
--   github.com/redis/go-redis/v9
--
-- API (called from a parent archetype):
--   local redis = require("golang-resource-redis")
--   redis.render(context, { destination = context:get("project-name") })
--
-- Context contract (no required keys beyond what the calling archetype provides).

local M = {}

function M.render(context, opts)
    opts = opts or {}
    local d = opts.destination
    if d and d ~= "" then
        directory.render("contents", context, { destination = d })
    else
        directory.render("contents", context)
    end
    return context
end

return M
