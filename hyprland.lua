require("general")
require("input")
require("gestures")
require("startup")
require("rules")
require("binds")
require("animations")
require("theme")


-- Collapsing script
local compacting = false

local function compact()
  if compacting then return end
  compacting = true

  local active = hl.get_active_workspace()
  local active_id = active and active.id

  -- keep workspaces that have windows, plus the one you're currently on
  local list = {}
  for _, ws in ipairs(hl.get_workspaces()) do
    if not ws.special and ws.id > 0 and (ws.windows > 0 or ws.id == active_id) then
      table.insert(list, ws)
    end
  end
  table.sort(list, function(a, b) return a.id < b.id end)

  -- walk upward, so each target ID is always already free
  for i, ws in ipairs(list) do
    if ws.id ~= i then
      hl.dispatch(hl.dsp.workspace.change_id({ workspace = tostring(ws.id), id = i }))
    end
  end

  compacting = false
end

-- Register listeners for all relevant workspace and window events
local events = {
  "workspace.active",
  "workspace.created",
  "workspace.removed",
}

for _, event in ipairs(events) do
  hl.on(event, function()
    pcall(compact)
  end)
end
