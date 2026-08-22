local screenW, screenH = 640, 480
local tabs = { "Hora", "Notas", "To Do", "Agenda", "Calc", "Timer", "MTG", "Config" }
local screens = tabs

local colors = {
  white = { 247 / 255, 247 / 255, 247 / 255 },
  softLilac = { 233 / 255, 180 / 255, 216 / 255 },
  deepPurple = { 46 / 255, 33 / 255, 87 / 255 },
  midPurple = { 92 / 255, 61 / 255, 140 / 255 },
  orange = { 242 / 255, 161 / 255, 26 / 255 },
  black = { 5 / 255, 3 / 255, 17 / 255 },
  panel = { 238 / 255, 235 / 255, 246 / 255 },
  panelText = { 33 / 255, 25 / 255, 55 / 255 },
}

local filters = {
  { name = "Roxo", color = { 68 / 255, 18 / 255, 132 / 255, 0.68 }, dark = 0.34 },
  { name = "Noite", color = { 5 / 255, 3 / 255, 17 / 255, 0.42 }, dark = 0.30 },
  { name = "Azul", color = { 20 / 255, 40 / 255, 96 / 255, 0.44 }, dark = 0.24 },
  { name = "Rosa", color = { 120 / 255, 34 / 255, 112 / 255, 0.38 }, dark = 0.24 },
  { name = "Verde", color = { 18 / 255, 72 / 255, 58 / 255, 0.38 }, dark = 0.24 },
  { name = "PB", color = { 0, 0, 0, 0 }, dark = 0.20 },
}

local magicColors = {
  { name = "Branco", bg = { 235 / 255, 222 / 255, 174 / 255 }, fg = { 5 / 255, 3 / 255, 17 / 255 } },
  { name = "Azul", bg = { 42 / 255, 106 / 255, 176 / 255 }, fg = { 247 / 255, 247 / 255, 247 / 255 } },
  { name = "Preto", bg = { 36 / 255, 30 / 255, 42 / 255 }, fg = { 247 / 255, 247 / 255, 247 / 255 } },
  { name = "Vermelho", bg = { 176 / 255, 54 / 255, 45 / 255 }, fg = { 247 / 255, 247 / 255, 247 / 255 } },
  { name = "Verde", bg = { 52 / 255, 132 / 255, 78 / 255 }, fg = { 247 / 255, 247 / 255, 247 / 255 } },
}

local state = {
  index = 1,
  previousIndex = 1,
  tabAnim = 0,
  tabDir = 1,
  clockOffset = 0,
  settingsCursor = 1,
  colorFilter = 1,
  timerRunning = 0,
  timerLeft = 300,
  timerSeconds = 300,
  timerPreset = 2,
  calendarMonthOffset = 0,
  calendarSelectedDay = 0,
  agendaMode = 1,
  agendaCursor = 1,
  events = 0,
  eventText1 = "",
  eventText2 = "",
  eventText3 = "",
  eventText4 = "",
  eventText5 = "",
  eventText6 = "",
  eventText7 = "",
  eventText8 = "",
  eventText9 = "",
  eventText10 = "",
  eventText11 = "",
  eventText12 = "",
  eventDate1 = 0,
  eventDate2 = 0,
  eventDate3 = 0,
  eventDate4 = 0,
  eventDate5 = 0,
  eventDate6 = 0,
  eventDate7 = 0,
  eventDate8 = 0,
  eventDate9 = 0,
  eventDate10 = 0,
  eventDate11 = 0,
  eventDate12 = 0,
  notes = 0,
  notesMode = 1,
  notesCursor = 1,
  keyboardCursor = 1,
  formatCursor = 1,
  noteText1 = "",
  noteText2 = "",
  noteText3 = "",
  noteText4 = "",
  noteText5 = "",
  noteText6 = "",
  noteText7 = "",
  noteText8 = "",
  noteText9 = "",
  noteText10 = "",
  noteText11 = "",
  noteText12 = "",
  noteTime1 = 0,
  noteTime2 = 0,
  noteTime3 = 0,
  noteTime4 = 0,
  noteTime5 = 0,
  noteTime6 = 0,
  noteTime7 = 0,
  noteTime8 = 0,
  noteTime9 = 0,
  noteTime10 = 0,
  noteTime11 = 0,
  noteTime12 = 0,
  todos = 0,
  todoMode = 1,
  todoCursor = 1,
  todoFilter = 1,
  todoText1 = "",
  todoText2 = "",
  todoText3 = "",
  todoText4 = "",
  todoText5 = "",
  todoText6 = "",
  todoText7 = "",
  todoText8 = "",
  todoText9 = "",
  todoText10 = "",
  todoText11 = "",
  todoText12 = "",
  todoTime1 = 0,
  todoTime2 = 0,
  todoTime3 = 0,
  todoTime4 = 0,
  todoTime5 = 0,
  todoTime6 = 0,
  todoTime7 = 0,
  todoTime8 = 0,
  todoTime9 = 0,
  todoTime10 = 0,
  todoTime11 = 0,
  todoTime12 = 0,
  todoDone1 = 0,
  todoDone2 = 0,
  todoDone3 = 0,
  todoDone4 = 0,
  todoDone5 = 0,
  todoDone6 = 0,
  todoDone7 = 0,
  todoDone8 = 0,
  todoDone9 = 0,
  todoDone10 = 0,
  todoDone11 = 0,
  todoDone12 = 0,
  todoPriority1 = 2,
  todoPriority2 = 2,
  todoPriority3 = 2,
  todoPriority4 = 2,
  todoPriority5 = 2,
  todoPriority6 = 2,
  todoPriority7 = 2,
  todoPriority8 = 2,
  todoPriority9 = 2,
  todoPriority10 = 2,
  todoPriority11 = 2,
  todoPriority12 = 2,
  todoDue1 = 0,
  todoDue2 = 0,
  todoDue3 = 0,
  todoDue4 = 0,
  todoDue5 = 0,
  todoDue6 = 0,
  todoDue7 = 0,
  todoDue8 = 0,
  todoDue9 = 0,
  todoDue10 = 0,
  todoDue11 = 0,
  todoDue12 = 0,
  calcDisplay = "0",
  calcStored = 0,
  calcOp = "",
  calcWaiting = 1,
  calcCursor = 1,
  calcMemory = 0,
  calcError = 0,
  mtgP1 = 20,
  mtgP2 = 20,
  mtgStep = "menu",
  mtgChoice = 1,
  mtgPlayers = 4,
  mtgSelectedPlayer = 1,
  mtgLife1 = 20,
  mtgLife2 = 20,
  mtgLife3 = 40,
  mtgLife4 = 40,
  mtgLife5 = 40,
  mtgLife6 = 40,
  mtgColor1 = 1,
  mtgColor2 = 2,
  mtgColor3 = 3,
  mtgColor4 = 4,
  mtgColor5 = 5,
  mtgColor6 = 1,
  mtgName1 = "P1",
  mtgName2 = "P2",
  mtgName3 = "P3",
  mtgName4 = "P4",
  mtgName5 = "P5",
  mtgName6 = "P6",
  mtgCommanderSlot = 0,
  mtgCmdDmg1 = 0,
  mtgCmdDmg2 = 0,
  mtgCmdDmg3 = 0,
  analogX = 0,
  analogY = 0,
  analogCooldown = 0,
  buttonCooldown = 0,
}

local assets = {
  wallpaper = nil,
  fontTiny = nil,
  fontSmall = nil,
  fontMedium = nil,
  fontCalc = nil,
  fontLarge = nil,
  fontClock = nil,
}

local keyboardRows = {
  { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" },
  { "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P" },
  { "A", "S", "D", "F", "G", "H", "J", "K", "L", "." },
  { "Z", "X", "C", "V", "B", "N", "M", ",", "?", "!" },
  { "-", "/", ":", "<", "ESP", ">", "+", "#", "OK" },
}

local keyboardKeys = {
  "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
  "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P",
  "A", "S", "D", "F", "G", "H", "J", "K", "L", ".",
  "Z", "X", "C", "V", "B", "N", "M", ",", "?", "!",
  "-", "/", ":", "<", "ESP", ">", "+", "#", "OK",
}

local formatActions = {
  "Titulo",
  "Lista",
  "Check",
  "Negrito",
  "Data/Hora",
  "Limpar",
}

local todoFilters = { "Todas", "Pendentes", "Feitas" }
local todoPriorities = { "Baixa", "Media", "Alta" }
local todoDueLabels = { "Sem Data", "Hoje", "Amanha" }
local timerPresets = {
  { label = "5", seconds = 300 },
  { label = "10", seconds = 600 },
  { label = "15", seconds = 900 },
  { label = "20", seconds = 1200 },
  { label = "25", seconds = 1500 },
}

local calcRows = {
  { "MC", "MR", "M+", "DEL" },
  { "C", "+/-", "%", "/" },
  { "7", "8", "9", "*" },
  { "4", "5", "6", "-" },
  { "1", "2", "3", "+" },
  { "0", ".", "RAIZ", "=" },
}

local calcKeys = {
  "MC", "MR", "M+", "DEL",
  "C", "+/-", "%", "/",
  "7", "8", "9", "*",
  "4", "5", "6", "-",
  "1", "2", "3", "+",
  "0", ".", "RAIZ", "=",
}

local function splitLines(text)
  local lines = {}
  for line in string.gmatch(text, "([^\n]+)") do
    table.insert(lines, line)
  end
  return lines
end

local function encodeText(text)
  text = text or ""
  text = text:gsub("%%", "%%25")
  text = text:gsub("\n", "%%0A")
  text = text:gsub("=", "%%3D")
  return text
end

local function decodeText(text)
  text = text or ""
  text = text:gsub("%%0A", "\n")
  text = text:gsub("%%3D", "=")
  text = text:gsub("%%25", "%%")
  return text
end

local function loadState()
  if not love.filesystem.getInfo("save.txt") then
    return
  end

  local raw = love.filesystem.read("save.txt") or ""
  for _, line in ipairs(splitLines(raw)) do
    local key, value = line:match("^([%w_]+)=(.+)$")
    if key and value then
      local numberValue = tonumber(value)
      if key == "screen" then
        for i, screen in ipairs(screens) do
          if screen == value then
            state.index = i
          end
        end
      elseif key == "mtgStep" then
        state.mtgStep = value
      elseif key == "calcDisplay" or key == "calcOp" then
        state[key] = value
      elseif key:match("^noteText%d+$") then
        state[key] = decodeText(value)
      elseif key:match("^todoText%d+$") then
        state[key] = decodeText(value)
      elseif key:match("^eventText%d+$") then
        state[key] = decodeText(value)
      elseif key:match("^mtgName%d+$") then
        state[key] = decodeText(value)
      elseif numberValue ~= nil then
        state[key] = numberValue
      end
    end
  end

  if state.colorFilter < 1 or state.colorFilter > #filters then
    state.colorFilter = 1
  end
  if state.mtgChoice < 1 or state.mtgChoice > 2 then
    state.mtgChoice = 1
  end
  if state.mtgPlayers < 1 or state.mtgPlayers > 6 then
    state.mtgPlayers = 1
  end
  if state.notesMode < 1 or state.notesMode > 3 then
    state.notesMode = 1
  end
  if state.notesCursor < 1 then
    state.notesCursor = 1
  end
  if state.keyboardCursor < 1 or state.keyboardCursor > #keyboardKeys then
    state.keyboardCursor = 1
  end
  if state.formatCursor < 1 or state.formatCursor > #formatActions then
    state.formatCursor = 1
  end
  if state.todoMode < 1 or state.todoMode > 2 then
    state.todoMode = 1
  end
  if state.todoCursor < 1 then
    state.todoCursor = 1
  end
  if state.todoFilter < 1 or state.todoFilter > #todoFilters then
    state.todoFilter = 1
  end
  if state.calcCursor < 1 or state.calcCursor > #calcKeys then
    state.calcCursor = 1
  end
  if state.calcWaiting ~= 0 and state.calcWaiting ~= 1 then
    state.calcWaiting = 1
  end
  if state.calcError ~= 0 and state.calcError ~= 1 then
    state.calcError = 0
  end
  if state.calcDisplay == "" then
    state.calcDisplay = "0"
  end
  if state.timerPreset < 0 or state.timerPreset > #timerPresets then
    state.timerPreset = 1
  end
  if state.timerSeconds < 60 or state.timerSeconds > 5940 then
    state.timerSeconds = timerPresets[math.max(1, state.timerPreset)].seconds
  end
  if state.timerLeft < 0 then
    state.timerLeft = 0
  end
  if state.agendaMode < 1 or state.agendaMode > 4 then
    state.agendaMode = 1
  end
  if state.agendaCursor < 1 then
    state.agendaCursor = 1
  end
  if state.events < 0 then
    state.events = 0
  end
  if state.events > 12 then
    state.events = 12
  end
  if state.events > 0 and state.agendaCursor > state.events then
    state.agendaCursor = state.events
  end
  if state.mtgCommanderSlot < 0 or state.mtgCommanderSlot > 3 then
    state.mtgCommanderSlot = 0
  end
  for i = 1, 6 do
    local nameKey = "mtgName" .. tostring(i)
    if state[nameKey] == "" then
      state[nameKey] = "P" .. tostring(i)
    end
  end
  if state.todos < 0 then
    state.todos = 0
  end
  if state.todos > 12 then
    state.todos = 12
  end
  if state.todos > 0 and state.todoCursor > state.todos then
    state.todoCursor = state.todos
  end
  for i = 1, 12 do
    local priorityKey = "todoPriority" .. tostring(i)
    local dueKey = "todoDue" .. tostring(i)
    local doneKey = "todoDone" .. tostring(i)
    if state[priorityKey] < 1 or state[priorityKey] > #todoPriorities then
      state[priorityKey] = 2
    end
    if state[dueKey] < 0 or state[dueKey] > 2 then
      state[dueKey] = 0
    end
    if state[doneKey] ~= 0 and state[doneKey] ~= 1 then
      state[doneKey] = 0
    end
  end
  for i = 1, 6 do
    local key = "mtgColor" .. tostring(i)
    if state[key] < 1 or state[key] > #magicColors then
      state[key] = ((i - 1) % #magicColors) + 1
    end
  end
end

local function saveState()
  local selected = screens[state.index] or "Hora"
  local data = table.concat({
    "screen=" .. selected,
    "clockOffset=" .. tostring(state.clockOffset),
    "settingsCursor=" .. tostring(state.settingsCursor),
    "colorFilter=" .. tostring(state.colorFilter),
    "timerRunning=" .. tostring(state.timerRunning),
    "timerLeft=" .. tostring(state.timerLeft),
    "timerSeconds=" .. tostring(state.timerSeconds),
    "timerPreset=" .. tostring(state.timerPreset),
    "calendarMonthOffset=" .. tostring(state.calendarMonthOffset),
    "calendarSelectedDay=" .. tostring(state.calendarSelectedDay),
    "agendaMode=" .. tostring(state.agendaMode),
    "agendaCursor=" .. tostring(state.agendaCursor),
    "events=" .. tostring(state.events),
    "eventText1=" .. encodeText(state.eventText1),
    "eventText2=" .. encodeText(state.eventText2),
    "eventText3=" .. encodeText(state.eventText3),
    "eventText4=" .. encodeText(state.eventText4),
    "eventText5=" .. encodeText(state.eventText5),
    "eventText6=" .. encodeText(state.eventText6),
    "eventText7=" .. encodeText(state.eventText7),
    "eventText8=" .. encodeText(state.eventText8),
    "eventText9=" .. encodeText(state.eventText9),
    "eventText10=" .. encodeText(state.eventText10),
    "eventText11=" .. encodeText(state.eventText11),
    "eventText12=" .. encodeText(state.eventText12),
    "eventDate1=" .. tostring(state.eventDate1),
    "eventDate2=" .. tostring(state.eventDate2),
    "eventDate3=" .. tostring(state.eventDate3),
    "eventDate4=" .. tostring(state.eventDate4),
    "eventDate5=" .. tostring(state.eventDate5),
    "eventDate6=" .. tostring(state.eventDate6),
    "eventDate7=" .. tostring(state.eventDate7),
    "eventDate8=" .. tostring(state.eventDate8),
    "eventDate9=" .. tostring(state.eventDate9),
    "eventDate10=" .. tostring(state.eventDate10),
    "eventDate11=" .. tostring(state.eventDate11),
    "eventDate12=" .. tostring(state.eventDate12),
    "notes=" .. tostring(state.notes),
    "notesMode=" .. tostring(state.notesMode),
    "notesCursor=" .. tostring(state.notesCursor),
    "keyboardCursor=" .. tostring(state.keyboardCursor),
    "formatCursor=" .. tostring(state.formatCursor),
    "noteText1=" .. encodeText(state.noteText1),
    "noteText2=" .. encodeText(state.noteText2),
    "noteText3=" .. encodeText(state.noteText3),
    "noteText4=" .. encodeText(state.noteText4),
    "noteText5=" .. encodeText(state.noteText5),
    "noteText6=" .. encodeText(state.noteText6),
    "noteText7=" .. encodeText(state.noteText7),
    "noteText8=" .. encodeText(state.noteText8),
    "noteText9=" .. encodeText(state.noteText9),
    "noteText10=" .. encodeText(state.noteText10),
    "noteText11=" .. encodeText(state.noteText11),
    "noteText12=" .. encodeText(state.noteText12),
    "noteTime1=" .. tostring(state.noteTime1),
    "noteTime2=" .. tostring(state.noteTime2),
    "noteTime3=" .. tostring(state.noteTime3),
    "noteTime4=" .. tostring(state.noteTime4),
    "noteTime5=" .. tostring(state.noteTime5),
    "noteTime6=" .. tostring(state.noteTime6),
    "noteTime7=" .. tostring(state.noteTime7),
    "noteTime8=" .. tostring(state.noteTime8),
    "noteTime9=" .. tostring(state.noteTime9),
    "noteTime10=" .. tostring(state.noteTime10),
    "noteTime11=" .. tostring(state.noteTime11),
    "noteTime12=" .. tostring(state.noteTime12),
    "todos=" .. tostring(state.todos),
    "todoMode=" .. tostring(state.todoMode),
    "todoCursor=" .. tostring(state.todoCursor),
    "todoFilter=" .. tostring(state.todoFilter),
    "todoText1=" .. encodeText(state.todoText1),
    "todoText2=" .. encodeText(state.todoText2),
    "todoText3=" .. encodeText(state.todoText3),
    "todoText4=" .. encodeText(state.todoText4),
    "todoText5=" .. encodeText(state.todoText5),
    "todoText6=" .. encodeText(state.todoText6),
    "todoText7=" .. encodeText(state.todoText7),
    "todoText8=" .. encodeText(state.todoText8),
    "todoText9=" .. encodeText(state.todoText9),
    "todoText10=" .. encodeText(state.todoText10),
    "todoText11=" .. encodeText(state.todoText11),
    "todoText12=" .. encodeText(state.todoText12),
    "todoTime1=" .. tostring(state.todoTime1),
    "todoTime2=" .. tostring(state.todoTime2),
    "todoTime3=" .. tostring(state.todoTime3),
    "todoTime4=" .. tostring(state.todoTime4),
    "todoTime5=" .. tostring(state.todoTime5),
    "todoTime6=" .. tostring(state.todoTime6),
    "todoTime7=" .. tostring(state.todoTime7),
    "todoTime8=" .. tostring(state.todoTime8),
    "todoTime9=" .. tostring(state.todoTime9),
    "todoTime10=" .. tostring(state.todoTime10),
    "todoTime11=" .. tostring(state.todoTime11),
    "todoTime12=" .. tostring(state.todoTime12),
    "todoDone1=" .. tostring(state.todoDone1),
    "todoDone2=" .. tostring(state.todoDone2),
    "todoDone3=" .. tostring(state.todoDone3),
    "todoDone4=" .. tostring(state.todoDone4),
    "todoDone5=" .. tostring(state.todoDone5),
    "todoDone6=" .. tostring(state.todoDone6),
    "todoDone7=" .. tostring(state.todoDone7),
    "todoDone8=" .. tostring(state.todoDone8),
    "todoDone9=" .. tostring(state.todoDone9),
    "todoDone10=" .. tostring(state.todoDone10),
    "todoDone11=" .. tostring(state.todoDone11),
    "todoDone12=" .. tostring(state.todoDone12),
    "todoPriority1=" .. tostring(state.todoPriority1),
    "todoPriority2=" .. tostring(state.todoPriority2),
    "todoPriority3=" .. tostring(state.todoPriority3),
    "todoPriority4=" .. tostring(state.todoPriority4),
    "todoPriority5=" .. tostring(state.todoPriority5),
    "todoPriority6=" .. tostring(state.todoPriority6),
    "todoPriority7=" .. tostring(state.todoPriority7),
    "todoPriority8=" .. tostring(state.todoPriority8),
    "todoPriority9=" .. tostring(state.todoPriority9),
    "todoPriority10=" .. tostring(state.todoPriority10),
    "todoPriority11=" .. tostring(state.todoPriority11),
    "todoPriority12=" .. tostring(state.todoPriority12),
    "todoDue1=" .. tostring(state.todoDue1),
    "todoDue2=" .. tostring(state.todoDue2),
    "todoDue3=" .. tostring(state.todoDue3),
    "todoDue4=" .. tostring(state.todoDue4),
    "todoDue5=" .. tostring(state.todoDue5),
    "todoDue6=" .. tostring(state.todoDue6),
    "todoDue7=" .. tostring(state.todoDue7),
    "todoDue8=" .. tostring(state.todoDue8),
    "todoDue9=" .. tostring(state.todoDue9),
    "todoDue10=" .. tostring(state.todoDue10),
    "todoDue11=" .. tostring(state.todoDue11),
    "todoDue12=" .. tostring(state.todoDue12),
    "calcDisplay=" .. tostring(state.calcDisplay),
    "calcStored=" .. tostring(state.calcStored),
    "calcOp=" .. tostring(state.calcOp),
    "calcWaiting=" .. tostring(state.calcWaiting),
    "calcCursor=" .. tostring(state.calcCursor),
    "calcMemory=" .. tostring(state.calcMemory),
    "calcError=" .. tostring(state.calcError),
    "mtgP1=" .. tostring(state.mtgP1),
    "mtgP2=" .. tostring(state.mtgP2),
    "mtgStep=" .. tostring(state.mtgStep),
    "mtgChoice=" .. tostring(state.mtgChoice),
    "mtgPlayers=" .. tostring(state.mtgPlayers),
    "mtgSelectedPlayer=" .. tostring(state.mtgSelectedPlayer),
    "mtgLife1=" .. tostring(state.mtgLife1),
    "mtgLife2=" .. tostring(state.mtgLife2),
    "mtgLife3=" .. tostring(state.mtgLife3),
    "mtgLife4=" .. tostring(state.mtgLife4),
    "mtgLife5=" .. tostring(state.mtgLife5),
    "mtgLife6=" .. tostring(state.mtgLife6),
    "mtgColor1=" .. tostring(state.mtgColor1),
    "mtgColor2=" .. tostring(state.mtgColor2),
    "mtgColor3=" .. tostring(state.mtgColor3),
    "mtgColor4=" .. tostring(state.mtgColor4),
    "mtgColor5=" .. tostring(state.mtgColor5),
    "mtgColor6=" .. tostring(state.mtgColor6),
    "mtgName1=" .. encodeText(state.mtgName1),
    "mtgName2=" .. encodeText(state.mtgName2),
    "mtgName3=" .. encodeText(state.mtgName3),
    "mtgName4=" .. encodeText(state.mtgName4),
    "mtgName5=" .. encodeText(state.mtgName5),
    "mtgName6=" .. encodeText(state.mtgName6),
    "mtgCommanderSlot=" .. tostring(state.mtgCommanderSlot),
    "mtgCmdDmg1=" .. tostring(state.mtgCmdDmg1),
    "mtgCmdDmg2=" .. tostring(state.mtgCmdDmg2),
    "mtgCmdDmg3=" .. tostring(state.mtgCmdDmg3),
  }, "\n")
  love.filesystem.write("save.txt", data)
end

local function projectFont(size)
  return love.graphics.newFont("assets/fonts/PressStart2P-Regular.ttf", size)
end

local function drawText(text, font, color, x, y, align, width)
  love.graphics.setFont(font)
  love.graphics.setColor(color)
  love.graphics.printf(text, x, y, width or screenW, align or "left")
end

local function drawCentered(text, font, color, y)
  drawText(text, font, color, 0, y, "center", screenW)
end

local function drawCenteredBox(text, font, color, x, y, width, height)
  love.graphics.setFont(font)
  local textHeight = font:getHeight()
  drawText(text, font, color, x, y + math.floor((height - textHeight) / 2), "center", width)
end

local function currentTime()
  return os.date("*t", os.time() + state.clockOffset)
end

local function clockText(showSecondsBlink)
  local now = currentTime()
  local colon = ":"
  if showSecondsBlink and math.floor(love.timer.getTime()) % 2 == 1 then
    colon = " "
  end
  return string.format("%02d%s%02d", now.hour, colon, now.min)
end

local function setCurrentTime(part, delta)
  local now = currentTime()
  local target = os.time({
    year = now.year,
    month = now.month,
    day = now.day,
    hour = now.hour,
    min = now.min,
    sec = 0,
  })

  if part == "hour" then target = target + delta * 3600 end
  if part == "minute" then target = target + delta * 60 end
  if part == "day" then target = target + delta * 86400 end
  if part == "month" then
    now.month = now.month + delta
    target = os.time(now)
  end
  if part == "year" then
    now.year = now.year + delta
    target = os.time(now)
  end

  state.clockOffset = target - os.time()
  saveState()
end

local function shiftedMonth(offset)
  local now = currentTime()
  local month = now.month + offset
  local year = now.year + math.floor((month - 1) / 12)
  month = ((month - 1) % 12) + 1
  return year, month, now.day
end

local function daysInMonth(year, month)
  return os.date("*t", os.time({ year = year, month = month + 1, day = 0 })).day
end

local function dateKey(year, month, day)
  return year * 10000 + month * 100 + day
end

local function dateInfoFromKey(key)
  local year = math.floor(key / 10000)
  local month = math.floor((key % 10000) / 100)
  local day = key % 100
  return year, month, day
end

local function addDaysToKey(key, amount)
  local year, month, day = dateInfoFromKey(key)
  local info = os.date("*t", os.time({ year = year, month = month, day = day + amount }))
  return dateKey(info.year, info.month, info.day)
end

local function selectedAgendaDate()
  local year, month, today = shiftedMonth(state.calendarMonthOffset)
  local total = daysInMonth(year, month)
  local day = state.calendarSelectedDay
  if day < 1 or day > total then
    day = math.min(today, total)
    state.calendarSelectedDay = day
  end
  return dateKey(year, month, day), year, month, day
end

local function setAgendaSelectedDate(key)
  local year, month, day = dateInfoFromKey(key)
  local now = currentTime()
  state.calendarMonthOffset = (year - now.year) * 12 + (month - now.month)
  state.calendarSelectedDay = day
end

local function eventText(index)
  return state["eventText" .. tostring(index)] or ""
end

local function setEventText(index, text)
  state["eventText" .. tostring(index)] = text or ""
end

local function eventTitle(index)
  local text = eventText(index):gsub("\n", " ")
  text = text:gsub("^%s+", ""):gsub("%s+$", "")
  if text == "" then
    return "Novo Evento"
  end
  if #text > 22 then
    return text:sub(1, 22) .. "."
  end
  return text
end

local function eventIndexesForDate(key)
  local indexes = {}
  for i = 1, state.events do
    if state["eventDate" .. tostring(i)] == key then
      table.insert(indexes, i)
    end
  end
  return indexes
end

local function eventCountForDate(key)
  return #eventIndexesForDate(key)
end

local function selectFirstEventForDate(key)
  local indexes = eventIndexesForDate(key)
  if #indexes > 0 then
    state.agendaCursor = indexes[1]
    return true
  end
  return false
end

local function selectedEventPositionForDate(key)
  local indexes = eventIndexesForDate(key)
  for pos, index in ipairs(indexes) do
    if index == state.agendaCursor then
      return pos, indexes
    end
  end
  if #indexes > 0 then
    state.agendaCursor = indexes[1]
    return 1, indexes
  end
  return 1, indexes
end

local function createEventForSelectedDate()
  if state.events >= 12 then
    return
  end
  local key = selectedAgendaDate()
  local index = state.events + 1
  state.events = index
  state["eventDate" .. tostring(index)] = key
  setEventText(index, "")
  state.agendaCursor = index
  state.agendaMode = 2
  state.keyboardCursor = 1
  saveState()
end

local function deleteCurrentEvent()
  if state.events < 1 then
    return
  end
  if state.agendaCursor < 1 or state.agendaCursor > state.events then
    state.agendaCursor = 1
  end

  for i = state.agendaCursor, state.events - 1 do
    state["eventText" .. tostring(i)] = state["eventText" .. tostring(i + 1)]
    state["eventDate" .. tostring(i)] = state["eventDate" .. tostring(i + 1)]
  end

  state["eventText" .. tostring(state.events)] = ""
  state["eventDate" .. tostring(state.events)] = 0
  state.events = state.events - 1
  if state.agendaCursor > state.events then
    state.agendaCursor = math.max(1, state.events)
  end
  saveState()
end

local function appendToCurrentEvent(text)
  if state.events < 1 then
    createEventForSelectedDate()
  end
  local current = eventText(state.agendaCursor)
  if #current > 120 then
    return
  end
  setEventText(state.agendaCursor, current .. text)
  saveState()
end

local function backspaceCurrentEvent()
  local current = eventText(state.agendaCursor)
  if current == "" then
    return
  end
  setEventText(state.agendaCursor, current:sub(1, #current - 1))
  saveState()
end

local function noteTime(index)
  return state["noteTime" .. tostring(index)] or 0
end

local function noteText(index)
  return state["noteText" .. tostring(index)] or ""
end

local function setNoteText(index, text)
  state["noteText" .. tostring(index)] = text or ""
end

local function noteTitle(index)
  local text = noteText(index)
  local first = text:match("#%s*([^\n]+)") or text:match("([^\n]+)") or ""
  first = first:gsub("^%s+", ""):gsub("%s+$", "")
  first = first:gsub("^#+%s*", "")
  if first == "" then
    return "Nota Sem Titulo"
  end
  if #first > 18 then
    return first:sub(1, 18) .. "."
  end
  return first
end

local function noteDate(index)
  local timestamp = noteTime(index)
  if timestamp <= 0 then
    return "--/-- --:--"
  end
  local info = os.date("*t", timestamp)
  return string.format("%02d/%02d %02d:%02d", info.day, info.month, info.hour, info.min)
end

local function clampNotesCursor()
  if state.notes < 1 then
    state.notesCursor = 1
  elseif state.notesCursor > state.notes then
    state.notesCursor = state.notes
  end
end

local function createQuickNote()
  if state.notes >= 12 then
    return
  end
  local index = state.notes + 1
  setNoteText(index, "")
  state["noteTime" .. tostring(index)] = os.time() + state.clockOffset
  state.notes = index
  state.notesCursor = index
  state.notesMode = 2
  saveState()
end

local function deleteCurrentNote()
  if state.notes < 1 then
    return
  end

  for i = state.notesCursor, state.notes - 1 do
    state["noteText" .. tostring(i)] = state["noteText" .. tostring(i + 1)]
    state["noteTime" .. tostring(i)] = state["noteTime" .. tostring(i + 1)]
  end

  state["noteText" .. tostring(state.notes)] = ""
  state["noteTime" .. tostring(state.notes)] = 0
  state.notes = state.notes - 1
  state.notesMode = 1
  clampNotesCursor()
  saveState()
end

local function appendToCurrentNote(text)
  if state.notes < 1 then
    createQuickNote()
  end
  local current = noteText(state.notesCursor)
  if #current > 480 then
    return
  end
  setNoteText(state.notesCursor, current .. text)
  saveState()
end

local function backspaceCurrentNote()
  local current = noteText(state.notesCursor)
  if current == "" then
    return
  end
  setNoteText(state.notesCursor, current:sub(1, #current - 1))
  saveState()
end

local function applyFormat()
  local action = formatActions[state.formatCursor]
  if action == "Titulo" then
    local current = noteText(state.notesCursor)
    if current == "" then
      appendToCurrentNote("# ")
    else
      appendToCurrentNote("\n# ")
    end
  elseif action == "Lista" then
    appendToCurrentNote("\n- ")
  elseif action == "Check" then
    appendToCurrentNote("\n- [ ] ")
  elseif action == "Negrito" then
    appendToCurrentNote("**")
  elseif action == "Data/Hora" then
    appendToCurrentNote("\n" .. noteDate(state.notesCursor) .. " ")
  elseif action == "Limpar" then
    setNoteText(state.notesCursor, "")
    saveState()
  end
  state.notesMode = 2
end

local function todoText(index)
  return state["todoText" .. tostring(index)] or ""
end

local function setTodoText(index, text)
  state["todoText" .. tostring(index)] = text or ""
end

local function todoTitle(index)
  local text = todoText(index):gsub("\n", " ")
  text = text:gsub("^%s+", ""):gsub("%s+$", "")
  if text == "" then
    return "Nova Tarefa"
  end
  if #text > 24 then
    return text:sub(1, 24) .. "."
  end
  return text
end

local function todoDate(index)
  local timestamp = state["todoTime" .. tostring(index)] or 0
  if timestamp <= 0 then
    return "--/--"
  end
  local info = os.date("*t", timestamp)
  return string.format("%02d/%02d", info.day, info.month)
end

local function todoPriorityLabel(index)
  local priority = state["todoPriority" .. tostring(index)] or 2
  return todoPriorities[priority] or "Media"
end

local function todoDueLabel(index)
  local due = state["todoDue" .. tostring(index)] or 0
  return todoDueLabels[due + 1] or "Sem Data"
end

local function visibleTodos()
  local visible = {}
  for i = 1, state.todos do
    local done = state["todoDone" .. tostring(i)] == 1
    if state.todoFilter == 1 or (state.todoFilter == 2 and not done) or (state.todoFilter == 3 and done) then
      table.insert(visible, i)
    end
  end
  return visible
end

local function clampTodoCursor()
  if state.todos < 1 then
    state.todoCursor = 1
    return
  end

  if state.todoCursor < 1 then
    state.todoCursor = 1
  end
  if state.todoCursor > state.todos then
    state.todoCursor = state.todos
  end

  local visible = visibleTodos()
  if #visible == 0 then
    return
  end

  for _, index in ipairs(visible) do
    if index == state.todoCursor then
      return
    end
  end
  state.todoCursor = visible[1]
end

local function createTodo()
  if state.todos >= 12 then
    return
  end

  local index = state.todos + 1
  state.todos = index
  setTodoText(index, "")
  state["todoTime" .. tostring(index)] = os.time() + state.clockOffset
  state["todoDone" .. tostring(index)] = 0
  state["todoPriority" .. tostring(index)] = 2
  state["todoDue" .. tostring(index)] = 0
  state.todoCursor = index
  state.todoMode = 2
  state.keyboardCursor = 1
  saveState()
end

local function deleteCurrentTodo()
  if state.todos < 1 then
    return
  end

  for i = state.todoCursor, state.todos - 1 do
    state["todoText" .. tostring(i)] = state["todoText" .. tostring(i + 1)]
    state["todoTime" .. tostring(i)] = state["todoTime" .. tostring(i + 1)]
    state["todoDone" .. tostring(i)] = state["todoDone" .. tostring(i + 1)]
    state["todoPriority" .. tostring(i)] = state["todoPriority" .. tostring(i + 1)]
    state["todoDue" .. tostring(i)] = state["todoDue" .. tostring(i + 1)]
  end

  state["todoText" .. tostring(state.todos)] = ""
  state["todoTime" .. tostring(state.todos)] = 0
  state["todoDone" .. tostring(state.todos)] = 0
  state["todoPriority" .. tostring(state.todos)] = 2
  state["todoDue" .. tostring(state.todos)] = 0
  state.todos = state.todos - 1
  state.todoMode = 1
  clampTodoCursor()
  saveState()
end

local function appendToCurrentTodo(text)
  if state.todos < 1 then
    createTodo()
  end
  local current = todoText(state.todoCursor)
  if #current > 160 then
    return
  end
  setTodoText(state.todoCursor, current .. text)
  saveState()
end

local function backspaceCurrentTodo()
  local current = todoText(state.todoCursor)
  if current == "" then
    return
  end
  setTodoText(state.todoCursor, current:sub(1, #current - 1))
  saveState()
end

local function toggleCurrentTodo()
  if state.todos < 1 then
    return
  end
  local key = "todoDone" .. tostring(state.todoCursor)
  state[key] = state[key] == 1 and 0 or 1
  saveState()
end

local function cycleTodoPriority()
  if state.todos < 1 then
    return
  end
  local key = "todoPriority" .. tostring(state.todoCursor)
  state[key] = (state[key] or 2) + 1
  if state[key] > #todoPriorities then
    state[key] = 1
  end
  saveState()
end

local function cycleTodoDue()
  if state.todos < 1 then
    return
  end
  local key = "todoDue" .. tostring(state.todoCursor)
  state[key] = (state[key] or 0) + 1
  if state[key] > 2 then
    state[key] = 0
  end
  saveState()
end

local function cycleTodoFilter()
  state.todoFilter = state.todoFilter + 1
  if state.todoFilter > #todoFilters then
    state.todoFilter = 1
  end
  clampTodoCursor()
  saveState()
end

local function calcValue()
  if state.calcError == 1 then
    return 0
  end
  return tonumber(state.calcDisplay) or 0
end

local function calcFormat(value)
  if value ~= value or value == math.huge or value == -math.huge then
    state.calcError = 1
    return "ERRO"
  end

  if math.abs(value) < 0.0000000001 then
    value = 0
  end

  local text
  if math.abs(value) >= 1000000000 or (math.abs(value) > 0 and math.abs(value) < 0.0001) then
    text = string.format("%.6e", value)
  else
    text = string.format("%.8f", value)
    text = text:gsub("0+$", ""):gsub("%.$", "")
  end

  if text == "-0" then
    text = "0"
  end
  if #text > 12 then
    text = text:sub(1, 12)
  end
  return text
end

local function calcReset()
  state.calcDisplay = "0"
  state.calcStored = 0
  state.calcOp = ""
  state.calcWaiting = 1
  state.calcError = 0
end

local function calcBackspace()
  if state.calcError == 1 or state.calcWaiting == 1 then
    state.calcDisplay = "0"
    state.calcError = 0
    state.calcWaiting = 1
    return
  end

  if #state.calcDisplay <= 1 or (#state.calcDisplay == 2 and state.calcDisplay:sub(1, 1) == "-") then
    state.calcDisplay = "0"
    state.calcWaiting = 1
  else
    state.calcDisplay = state.calcDisplay:sub(1, #state.calcDisplay - 1)
  end
end

local function calcInputDigit(label)
  if state.calcError == 1 then
    calcReset()
  end

  if state.calcWaiting == 1 then
    state.calcDisplay = label == "." and "0." or label
    state.calcWaiting = 0
    return
  end

  if label == "." and state.calcDisplay:find(".", 1, true) then
    return
  end
  if #state.calcDisplay >= 12 then
    return
  end
  if state.calcDisplay == "0" and label ~= "." then
    state.calcDisplay = label
  else
    state.calcDisplay = state.calcDisplay .. label
  end
end

local function calcRunOperation(left, op, right)
  if op == "+" then return left + right end
  if op == "-" then return left - right end
  if op == "*" then return left * right end
  if op == "/" then
    if right == 0 then
      return math.huge
    end
    return left / right
  end
  return right
end

local function calcCommit()
  local current = calcValue()
  if state.calcOp ~= "" and state.calcWaiting == 0 then
    local result = calcRunOperation(state.calcStored, state.calcOp, current)
    state.calcDisplay = calcFormat(result)
    state.calcStored = tonumber(state.calcDisplay) or 0
  else
    state.calcStored = current
  end
  state.calcWaiting = 1
end

local function calcSetOperation(op)
  if state.calcError == 1 then
    calcReset()
  end
  calcCommit()
  state.calcOp = op
end

local function calcEqual()
  if state.calcOp == "" then
    return
  end
  calcCommit()
  state.calcOp = ""
end

local function calcUnary(label)
  local value = calcValue()
  if label == "+/-" then
    value = -value
  elseif label == "%" then
    value = value / 100
  elseif label == "RAIZ" then
    if value < 0 then
      state.calcError = 1
      state.calcDisplay = "ERRO"
      state.calcWaiting = 1
      return
    end
    value = math.sqrt(value)
  end
  state.calcDisplay = calcFormat(value)
  state.calcWaiting = 1
end

local function calcPress(label)
  if label:match("^%d$") or label == "." then
    calcInputDigit(label)
  elseif label == "+" or label == "-" or label == "*" or label == "/" then
    calcSetOperation(label)
  elseif label == "=" then
    calcEqual()
  elseif label == "C" then
    calcReset()
  elseif label == "DEL" then
    calcBackspace()
  elseif label == "+/-" or label == "%" or label == "RAIZ" then
    calcUnary(label)
  elseif label == "MC" then
    state.calcMemory = 0
  elseif label == "MR" then
    state.calcDisplay = calcFormat(state.calcMemory)
    state.calcWaiting = 1
  elseif label == "M+" then
    state.calcMemory = state.calcMemory + calcValue()
  end
  saveState()
end

local function calcPosition(index)
  local count = 0
  for rowIndex, row in ipairs(calcRows) do
    if index <= count + #row then
      return rowIndex, index - count
    end
    count = count + #row
  end
  return 1, 1
end

local function calcIndex(rowIndex, colIndex)
  local count = 0
  rowIndex = math.max(1, math.min(#calcRows, rowIndex))
  colIndex = math.max(1, math.min(#calcRows[rowIndex], colIndex))
  for i = 1, rowIndex - 1 do
    count = count + #calcRows[i]
  end
  return count + colIndex
end

local function keyboardPosition(index)
  local count = 0
  for rowIndex, row in ipairs(keyboardRows) do
    if index <= count + #row then
      return rowIndex, index - count
    end
    count = count + #row
  end
  return 1, 1
end

local function keyboardIndex(rowIndex, colIndex)
  local count = 0
  rowIndex = math.max(1, math.min(#keyboardRows, rowIndex))
  colIndex = math.max(1, math.min(#keyboardRows[rowIndex], colIndex))
  for i = 1, rowIndex - 1 do
    count = count + #keyboardRows[i]
  end
  return count + colIndex
end

local function drawBackground()
  love.graphics.setColor(1, 1, 1)
  if assets.wallpaper then
    local scaleX = screenW / assets.wallpaper:getWidth()
    local scaleY = screenH / assets.wallpaper:getHeight()
    love.graphics.draw(assets.wallpaper, 0, 0, 0, scaleX, scaleY)
  else
    love.graphics.setColor(colors.black)
    love.graphics.rectangle("fill", 0, 0, screenW, screenH)
  end

  local filter = filters[state.colorFilter] or filters[1]
  love.graphics.setColor(filter.color)
  love.graphics.rectangle("fill", 0, 0, screenW, screenH)
  love.graphics.setColor(0, 0, 0, filter.dark)
  love.graphics.rectangle("fill", 0, 0, screenW, screenH)
end

local function drawTopBar()
  local totalW = -5
  for _, tab in ipairs(tabs) do
    totalW = totalW + assets.fontTiny:getWidth(tab) + 12 + 5
  end

  local x = math.floor((screenW - totalW) / 2)
  love.graphics.setFont(assets.fontSmall)

  for i, tab in ipairs(tabs) do
    local w = assets.fontTiny:getWidth(tab) + 12
    local selected = i == state.index
    drawCenteredBox(tab, assets.fontTiny, selected and colors.orange or colors.softLilac, x, 7, w, 29)
    if selected then
      love.graphics.setColor(colors.orange)
      love.graphics.rectangle("fill", x + 6, 36, w - 12, 2)
    end
    x = x + w + 5
  end

  drawCenteredBox("L1 <", assets.fontTiny, colors.softLilac, 8, 7, 48, 29)
  drawCenteredBox("> R1", assets.fontTiny, colors.softLilac, 584, 7, 48, 29)
end

local function drawClock()
  local now = currentTime()
  love.graphics.setFont(assets.fontClock)
  local timeText = clockText(true)
  local timeHeight = assets.fontClock:getHeight()
  drawText(timeText, assets.fontClock, colors.white, 0, math.floor((screenH - timeHeight) / 2), "center", screenW)
  drawCentered(string.format("%02d/%02d/%04d", now.day, now.month, now.year), assets.fontMedium, colors.softLilac, 342)
end

local function placeholderLines(screen)
  if screen == "To Do" then return { "Lista Offline Pronta.", "Adicionar/Marcar Entra Na Proxima Etapa.", "Total: " .. state.todos } end
  if screen == "Calc" then return { "Calculadora Simples.", "Entrada Por Controle Entra Aqui." } end
  return {}
end

local function drawNotesList()
  drawCentered("Notas", assets.fontMedium, colors.white, 74)
  drawCentered("A Edita   X Nova   B Apaga", assets.fontSmall, colors.softLilac, 112)

  if state.notes == 0 then
    drawCentered("Sem Notas Ainda", assets.fontMedium, colors.white, 196)
    drawCentered("A Ou X Para Criar", assets.fontSmall, colors.softLilac, 250)
    return
  end

  local y = 150
  local first = math.max(1, math.min(state.notesCursor - 2, math.max(1, state.notes - 4)))
  local last = math.min(state.notes, first + 4)

  for i = first, last do
    local selected = i == state.notesCursor
    love.graphics.setColor(selected and colors.orange or colors.deepPurple)
    love.graphics.rectangle("fill", 70, y - 8, 500, 34)
    drawText(tostring(i) .. ". " .. noteTitle(i), assets.fontSmall, selected and colors.black or colors.white, 92, y, "left", 240)
    drawText(noteDate(i), assets.fontSmall, selected and colors.black or colors.white, 346, y, "right", 190)
    y = y + 42
  end
end

local function drawWrappedNoteText(text, x, y, width, maxLines, color)
  love.graphics.setFont(assets.fontSmall)
  local line = ""
  local lines = {}

  for char in text:gmatch(".") do
    if char == "\n" then
      table.insert(lines, line)
      line = ""
    else
      local candidate = line .. char
      if assets.fontSmall:getWidth(candidate) > width then
        table.insert(lines, line)
        line = char
      else
        line = candidate
      end
    end
  end
  table.insert(lines, line)

  local first = math.max(1, #lines - maxLines + 1)
  local drawY = y
  for i = first, #lines do
    drawText(lines[i] == "" and " " or lines[i], assets.fontSmall, color, x, drawY, "left", width)
    drawY = drawY + 18
  end
end

local function drawKeyboard()
  local startX = 38
  local startY = 280
  local keyW = 51
  local keyH = 28
  local gap = 6

  for rowIndex, row in ipairs(keyboardRows) do
    local runningIndex = 0
    for prior = 1, rowIndex - 1 do
      runningIndex = runningIndex + #keyboardRows[prior]
    end

    local drawCol = 0
    for colIndex, label in ipairs(row) do
      local index = runningIndex + colIndex
      local selected = index == state.keyboardCursor
      local x = startX + drawCol * (keyW + gap)
      local y = startY + (rowIndex - 1) * (keyH + 6)
      local drawW = keyW
      if label == "ESP" then
        drawW = keyW * 2 + gap
      end

      love.graphics.setColor(selected and colors.orange or colors.deepPurple)
      love.graphics.rectangle("fill", x, y, drawW, keyH)
      drawCenteredBox(label, assets.fontTiny, selected and colors.black or colors.white, x, y, drawW, keyH)
      drawCol = drawCol + (label == "ESP" and 2 or 1)
    end
  end
end

local function drawNotesEditor()
  if state.notes == 0 then
    createQuickNote()
  end

  love.graphics.setColor(colors.panel)
  love.graphics.rectangle("fill", 38, 68, 564, 198)
  love.graphics.setColor(colors.orange)
  love.graphics.setLineWidth(4)
  love.graphics.rectangle("line", 38, 68, 564, 198)

  drawCentered("Nota " .. tostring(state.notesCursor), assets.fontMedium, colors.panelText, 122)
  drawText(noteDate(state.notesCursor), assets.fontSmall, colors.midPurple, 410, 84, "right", 170)

  local text = noteText(state.notesCursor)
  if text == "" then
    drawCentered("Use O Teclado Virtual", assets.fontSmall, colors.midPurple, 170)
  else
    drawWrappedNoteText(text, 62, 142, 516, 6, colors.panelText)
  end

  drawKeyboard()
end

local function drawNotesFormat()
  drawCentered("Formatar", assets.fontMedium, colors.white, 82)
  drawCentered("A Aplica   B Volta", assets.fontSmall, colors.softLilac, 124)

  local y = 170
  for i, label in ipairs(formatActions) do
    local selected = i == state.formatCursor
    love.graphics.setColor(selected and colors.orange or colors.deepPurple)
    love.graphics.rectangle("fill", 138, y - 8, 364, 32)
    drawText(label, assets.fontSmall, selected and colors.black or colors.white, 138, y, "center", 364)
    y = y + 42
  end
end

local function drawNotes()
  if state.notesMode == 2 then
    drawNotesEditor()
  elseif state.notesMode == 3 then
    drawNotesFormat()
  else
    drawNotesList()
  end
end

local function drawTodoList()
  drawCentered("To Do", assets.fontMedium, colors.white, 74)
  drawCentered("Filtro: " .. todoFilters[state.todoFilter], assets.fontSmall, colors.softLilac, 112)

  if state.todos == 0 then
    drawCentered("Sem Tarefas Ainda", assets.fontMedium, colors.white, 196)
    drawCentered("A Ou X Para Criar", assets.fontSmall, colors.softLilac, 250)
    return
  end

  local visible = visibleTodos()
  if #visible == 0 then
    drawCentered("Nada Neste Filtro", assets.fontMedium, colors.white, 196)
    drawCentered("Start Muda Filtro", assets.fontSmall, colors.softLilac, 250)
    return
  end

  local selectedPos = 1
  for pos, index in ipairs(visible) do
    if index == state.todoCursor then
      selectedPos = pos
    end
  end

  local first = math.max(1, math.min(selectedPos - 2, math.max(1, #visible - 4)))
  local last = math.min(#visible, first + 4)
  local y = 150

  for pos = first, last do
    local index = visible[pos]
    local selected = index == state.todoCursor
    local done = state["todoDone" .. tostring(index)] == 1
    local priority = state["todoPriority" .. tostring(index)] or 2
    local marker = done and "[X]" or "[ ]"
    local priorityMark = priority == 3 and "!" or (priority == 2 and "*" or "-")
    local color = selected and colors.black or (done and colors.softLilac or colors.white)

    love.graphics.setColor(selected and colors.orange or colors.deepPurple)
    love.graphics.rectangle("fill", 52, y - 8, 536, 34)
    drawText(marker, assets.fontSmall, color, 66, y, "left", 54)
    drawText(priorityMark, assets.fontSmall, color, 122, y, "center", 30)
    drawText(todoTitle(index), assets.fontSmall, color, 156, y, "left", 250)
    drawText(todoDueLabel(index), assets.fontTiny, color, 408, y + 2, "right", 94)
    drawText(todoDate(index), assets.fontTiny, color, 504, y + 2, "right", 66)
    y = y + 42
  end
end

local function drawTodoEditor()
  if state.todos == 0 then
    createTodo()
  end

  love.graphics.setColor(colors.panel)
  love.graphics.rectangle("fill", 38, 68, 564, 198)
  love.graphics.setColor(colors.orange)
  love.graphics.setLineWidth(4)
  love.graphics.rectangle("line", 38, 68, 564, 198)

  drawCentered("Tarefa " .. tostring(state.todoCursor), assets.fontMedium, colors.panelText, 94)
  drawText(todoPriorityLabel(state.todoCursor), assets.fontSmall, colors.midPurple, 62, 124, "left", 170)
  drawText(todoDueLabel(state.todoCursor), assets.fontSmall, colors.midPurple, 378, 124, "right", 180)

  local text = todoText(state.todoCursor)
  if text == "" then
    drawCentered("Digite A Tarefa", assets.fontSmall, colors.midPurple, 176)
  else
    drawWrappedNoteText(text, 62, 162, 516, 4, colors.panelText)
  end

  drawKeyboard()
end

local function drawTodo()
  if state.todoMode == 2 then
    drawTodoEditor()
  else
    drawTodoList()
  end
end

local function drawCalc()
  love.graphics.setColor(colors.panel)
  love.graphics.rectangle("fill", 48, 72, 544, 96)
  love.graphics.setColor(colors.orange)
  love.graphics.setLineWidth(4)
  love.graphics.rectangle("line", 48, 72, 544, 96)

  local opText = state.calcOp ~= "" and ("OP " .. state.calcOp) or "CALC"
  if state.calcMemory ~= 0 then
    opText = opText .. "  M"
  end
  drawText(opText, assets.fontTiny, colors.midPurple, 66, 88, "left", 210)
  drawText(state.calcDisplay, assets.fontCalc, colors.panelText, 64, 112, "right", 510)

  local startX = 74
  local startY = 190
  local keyW = 112
  local keyH = 36
  local gap = 8

  for rowIndex, row in ipairs(calcRows) do
    for colIndex, label in ipairs(row) do
      local index = calcIndex(rowIndex, colIndex)
      local selected = index == state.calcCursor
      local x = startX + (colIndex - 1) * (keyW + gap)
      local y = startY + (rowIndex - 1) * (keyH + gap)
      local isOp = label == "+" or label == "-" or label == "*" or label == "/" or label == "="

      love.graphics.setColor(selected and colors.orange or (isOp and colors.midPurple or colors.deepPurple))
      love.graphics.rectangle("fill", x, y, keyW, keyH)
      drawCenteredBox(label, assets.fontSmall, selected and colors.black or colors.white, x, y, keyW, keyH)
    end
  end
end

local function drawCalendarMonth()
  local year, month, today = shiftedMonth(state.calendarMonthOffset)
  local monthNames = { "Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez" }
  local week = { "D", "S", "T", "Q", "Q", "S", "S" }
  local firstWeekday = tonumber(os.date("%w", os.time({ year = year, month = month, day = 1 }))) + 1
  local totalDays = daysInMonth(year, month)
  local realNow = currentTime()
  if state.calendarSelectedDay < 1 or state.calendarSelectedDay > totalDays then
    state.calendarSelectedDay = math.min(today, totalDays)
  end

  love.graphics.setColor(colors.panel)
  love.graphics.rectangle("fill", 58, 78, 524, 344)
  love.graphics.setColor(colors.orange)
  love.graphics.setLineWidth(4)
  love.graphics.rectangle("line", 58, 78, 524, 344)

  drawCentered(monthNames[month] .. " " .. tostring(year), assets.fontMedium, colors.panelText, 104)

  local gridX = 104
  local gridY = 154
  local cellW = 62
  local cellH = 34

  for i, label in ipairs(week) do
    drawText(label, assets.fontSmall, colors.midPurple, gridX + (i - 1) * cellW, gridY, "center", cellW)
  end

  for day = 1, totalDays do
    local pos = firstWeekday + day - 2
    local col = pos % 7
    local row = math.floor(pos / 7)
    local x = gridX + col * cellW
    local y = gridY + 34 + row * cellH
    local isToday = state.calendarMonthOffset == 0 and day == realNow.day and month == realNow.month and year == realNow.year
    local selected = day == state.calendarSelectedDay
    local hasEvent = eventCountForDate(dateKey(year, month, day)) > 0

    if selected then
      love.graphics.setColor(colors.orange)
      love.graphics.rectangle("fill", x + 7, y - 7, cellW - 14, 26)
      drawText(tostring(day), assets.fontSmall, colors.black, x, y, "center", cellW)
    elseif isToday then
      love.graphics.setColor(colors.midPurple)
      love.graphics.rectangle("fill", x + 10, y - 6, cellW - 20, 24)
      drawText(tostring(day), assets.fontSmall, colors.white, x, y, "center", cellW)
    else
      drawText(tostring(day), assets.fontSmall, colors.panelText, x, y, "center", cellW)
    end
    if hasEvent then
      love.graphics.setColor(selected and colors.black or colors.orange)
      love.graphics.rectangle("fill", x + 28, y + 18, 6, 4)
    end
  end

  local key = selectedAgendaDate()
  local count = eventCountForDate(key)
  drawCentered("Dia " .. tostring(state.calendarSelectedDay) .. "  Eventos: " .. tostring(count), assets.fontSmall, colors.midPurple, 372)
  drawCentered("A Novo   X 3 Dias   B Apaga", assets.fontSmall, colors.midPurple, 398)
end

local function drawCalendarEditor()
  if state.events == 0 then
    createEventForSelectedDate()
  end

  love.graphics.setColor(colors.panel)
  love.graphics.rectangle("fill", 38, 68, 564, 198)
  love.graphics.setColor(colors.orange)
  love.graphics.setLineWidth(4)
  love.graphics.rectangle("line", 38, 68, 564, 198)

  local year, month, day = dateInfoFromKey(state["eventDate" .. tostring(state.agendaCursor)] or selectedAgendaDate())
  drawCentered("Evento " .. string.format("%02d/%02d", day, month), assets.fontMedium, colors.panelText, 94)

  local text = eventText(state.agendaCursor)
  if text == "" then
    drawCentered("Digite O Evento", assets.fontSmall, colors.midPurple, 172)
  else
    drawWrappedNoteText(text, 62, 150, 516, 5, colors.panelText)
  end

  drawKeyboard()
end

local function drawCalendarThreeDays()
  local startKey = selectedAgendaDate()
  drawCentered("Agenda 3 Dias", assets.fontMedium, colors.white, 72)

  for offset = 0, 2 do
    local key = addDaysToKey(startKey, offset)
    local year, month, day = dateInfoFromKey(key)
    local y = 118 + offset * 100
    love.graphics.setColor(colors.panel)
    love.graphics.rectangle("fill", 54, y, 532, 82)
    love.graphics.setColor(offset == 0 and colors.orange or colors.deepPurple)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", 54, y, 532, 82)
    drawText(string.format("%02d/%02d", day, month), assets.fontSmall, colors.panelText, 74, y + 12, "left", 110)

    local indexes = eventIndexesForDate(key)
    if #indexes == 0 then
      drawText("Sem Eventos", assets.fontSmall, colors.midPurple, 188, y + 12, "left", 340)
    else
      local lineY = y + 12
      for i = 1, math.min(2, #indexes) do
        drawText(eventTitle(indexes[i]), assets.fontSmall, colors.panelText, 188, lineY, "left", 330)
        lineY = lineY + 28
      end
    end
  end

  drawCentered("B Volta   A Novo", assets.fontSmall, colors.softLilac, 404)
end

local function drawCalendarEventList()
  local key, _, month, day = selectedAgendaDate()
  local _, indexes = selectedEventPositionForDate(key)

  drawCentered("Eventos " .. string.format("%02d/%02d", day, month), assets.fontMedium, colors.white, 74)
  drawCentered("A Edita   B Apaga   X Volta", assets.fontSmall, colors.softLilac, 112)

  if #indexes == 0 then
    drawCentered("Sem Eventos Neste Dia", assets.fontMedium, colors.white, 196)
    drawCentered("A Para Criar", assets.fontSmall, colors.softLilac, 250)
    return
  end

  local y = 154
  for pos, index in ipairs(indexes) do
    if pos <= 6 then
      local selected = index == state.agendaCursor
      love.graphics.setColor(selected and colors.orange or colors.deepPurple)
      love.graphics.rectangle("fill", 64, y - 8, 512, 34)
      drawText(tostring(pos) .. ". " .. eventTitle(index), assets.fontSmall, selected and colors.black or colors.white, 86, y, "left", 450)
      y = y + 42
    end
  end
end

local function drawCalendar()
  if state.agendaMode == 2 then
    drawCalendarEditor()
  elseif state.agendaMode == 3 then
    drawCalendarThreeDays()
  elseif state.agendaMode == 4 then
    drawCalendarEventList()
  else
    drawCalendarMonth()
  end
end

local function drawTimer()
  local mins = math.floor(state.timerLeft / 60)
  local secs = state.timerLeft % 60
  drawCentered("Timer", assets.fontMedium, colors.white, 104)
  drawCentered(string.format("%02d:%02d", mins, secs), assets.fontLarge, colors.white, 174)
  local modeLabel = state.timerPreset == 0 and "Manual" or "Preset"
  drawCentered(state.timerRunning == 1 and "Rodando" or modeLabel, assets.fontSmall, colors.softLilac, 286)

  local startX = 52
  local y = 318
  local w = 70
  local h = 34
  local gap = 6
  for i, preset in ipairs(timerPresets) do
    local selected = i == state.timerPreset
    love.graphics.setColor(selected and colors.orange or colors.deepPurple)
    love.graphics.rectangle("fill", startX + (i - 1) * (w + gap), y, w, h)
    drawCenteredBox(preset.label, assets.fontSmall, selected and colors.black or colors.white, startX + (i - 1) * (w + gap), y, w, h)
  end

  drawCentered(state.timerRunning == 1 and "A Pausa   B Reinicia" or "A Inicia   B Reinicia", assets.fontSmall, colors.softLilac, 382)
  drawCentered("Esq/Dir Preset   Cima/Baixo Min", assets.fontSmall, colors.softLilac, 412)
end

local function mtgLife(index)
  return state["mtgLife" .. tostring(index)] or 20
end

local function setMtgLife(index, value)
  state["mtgLife" .. tostring(index)] = math.max(0, value)
end

local function mtgColor(index)
  local colorIndex = state["mtgColor" .. tostring(index)] or 1
  return magicColors[colorIndex] or magicColors[1]
end

local function cycleMtgColor(index)
  local key = "mtgColor" .. tostring(index)
  state[key] = (state[key] or 1) + 1
  if state[key] > #magicColors then
    state[key] = 1
  end
end

local function mtgName(index)
  local name = state["mtgName" .. tostring(index)] or ("P" .. tostring(index))
  if name == "" then
    name = "P" .. tostring(index)
  end
  if #name > 10 then
    return name:sub(1, 10)
  end
  return name
end

local function appendToMtgName(text)
  local key = "mtgName" .. tostring(state.mtgSelectedPlayer)
  local current = state[key] or ""
  if current == "P" .. tostring(state.mtgSelectedPlayer) then
    current = ""
  end
  if #current > 10 then
    return
  end
  state[key] = current .. text
  saveState()
end

local function backspaceMtgName()
  local key = "mtgName" .. tostring(state.mtgSelectedPlayer)
  local current = state[key] or ""
  if current == "" then
    return
  end
  state[key] = current:sub(1, #current - 1)
  saveState()
end

local function adjustCommanderDamage(slot, delta)
  local key = "mtgCmdDmg" .. tostring(slot)
  local current = state[key] or 0
  if delta > 0 then
    state[key] = current + 1
    setMtgLife(1, mtgLife(1) - 1)
  elseif delta < 0 and current > 0 then
    state[key] = current - 1
    setMtgLife(1, mtgLife(1) + 1)
  end
end

local function startMtgGame()
  local life = state.mtgChoice == 1 and 20 or 40
  local players = state.mtgPlayers
  state.mtgPlayers = players
  state.mtgSelectedPlayer = 1
  state.mtgCommanderSlot = 0
  state.mtgCmdDmg1 = 0
  state.mtgCmdDmg2 = 0
  state.mtgCmdDmg3 = 0
  state.mtgStep = "game"
  for i = 1, 6 do
    setMtgLife(i, i <= players and life or 0)
    state["mtgColor" .. tostring(i)] = ((i - 1) % #magicColors) + 1
  end
  state.mtgP1 = mtgLife(1)
  state.mtgP2 = mtgLife(2)
  saveState()
end

local function drawMtgChoice(label, index, y)
  local selected = state.mtgChoice == index
  love.graphics.setColor(selected and colors.orange or colors.deepPurple)
  love.graphics.rectangle("fill", 150, y, 340, 42)
  drawCenteredBox(label, assets.fontSmall, selected and colors.black or colors.white, 150, y, 340, 42)
end

local function drawMtgMenu()
  drawCentered("MTG", assets.fontMedium, colors.white, 96)
  drawCentered("Tipo De Jogo", assets.fontSmall, colors.softLilac, 140)
  drawMtgChoice("Normal", 1, 184)
  drawMtgChoice("Commander", 2, 238)
  drawCentered("Direcional Escolhe   A Confirma", assets.fontSmall, colors.softLilac, 332)
end

local function drawMtgPlayers()
  drawCentered(state.mtgChoice == 1 and "Normal" or "Commander", assets.fontMedium, colors.white, 108)
  drawCentered("Quantos Jogadores?", assets.fontSmall, colors.softLilac, 158)
  drawCentered(tostring(state.mtgPlayers), assets.fontLarge, colors.white, 206)
  drawCentered("Esq/Dir Muda   A Inicia", assets.fontSmall, colors.softLilac, 324)
  drawCentered("B Volta", assets.fontSmall, colors.softLilac, 358)
end

local function drawMtgSoloCommander()
  local playerColor = mtgColor(1)
  drawCentered("Commander Solo", assets.fontMedium, colors.white, 70)

  love.graphics.setColor(playerColor.bg)
  love.graphics.rectangle("fill", 150, 116, 340, 150)
  love.graphics.setColor(state.mtgCommanderSlot == 0 and colors.orange or colors.deepPurple)
  love.graphics.setLineWidth(4)
  love.graphics.rectangle("line", 146, 112, 348, 158)
  drawText(mtgName(1), assets.fontSmall, playerColor.fg, 150, 134, "center", 340)
  drawText(tostring(mtgLife(1)), assets.fontLarge, playerColor.fg, 150, 172, "center", 340)

  for i = 1, 3 do
    local x = 92 + (i - 1) * 158
    local selected = state.mtgCommanderSlot == i
    love.graphics.setColor(selected and colors.orange or colors.deepPurple)
    love.graphics.rectangle("fill", x, 298, 132, 74)
    drawText("CMD " .. tostring(i), assets.fontTiny, selected and colors.black or colors.white, x, 310, "center", 132)
    drawText(tostring(state["mtgCmdDmg" .. tostring(i)] or 0), assets.fontMedium, selected and colors.black or colors.white, x, 336, "center", 132)
  end

  drawCentered("Esq/Dir Foco   Cima/Baixo Ajusta", assets.fontSmall, colors.softLilac, 392)
end

local function drawMtgNameEditor()
  love.graphics.setColor(colors.panel)
  love.graphics.rectangle("fill", 38, 68, 564, 198)
  love.graphics.setColor(colors.orange)
  love.graphics.setLineWidth(4)
  love.graphics.rectangle("line", 38, 68, 564, 198)

  drawCentered("Nome Do Jogador", assets.fontMedium, colors.panelText, 94)
  drawCentered(mtgName(state.mtgSelectedPlayer), assets.fontMedium, colors.midPurple, 156)
  drawKeyboard()
end

local function drawMtgGame()
  local title = state.mtgChoice == 1 and "MTG Normal" or "Commander"

  if state.mtgChoice == 2 and state.mtgPlayers == 1 then
    drawMtgSoloCommander()
    return
  end

  drawCentered(title, assets.fontMedium, colors.white, 78)

  local count = state.mtgPlayers
  local cols = 3
  if count == 2 or count == 4 then
    cols = 2
  end

  local cellW = cols == 2 and 190 or 160
  local startX = cols == 2 and 130 or 80
  local startY = count == 4 and 132 or (count <= 3 and 156 or 128)

  for i = 1, count do
    local col = (i - 1) % cols
    local row = math.floor((i - 1) / cols)
    local x = startX + col * cellW
    local y = startY + row * 108
    local selected = i == state.mtgSelectedPlayer
    local playerColor = mtgColor(i)
    love.graphics.setColor(playerColor.bg)
    love.graphics.rectangle("fill", x, y, cellW - 18, 84)
    if selected then
      love.graphics.setColor(colors.orange)
      love.graphics.setLineWidth(4)
      love.graphics.rectangle("line", x - 3, y - 3, cellW - 12, 90)
    end
    drawText(mtgName(i), assets.fontSmall, playerColor.fg, x, y + 12, "center", cellW - 18)
    drawText(tostring(mtgLife(i)), assets.fontMedium, playerColor.fg, x, y + 42, "center", cellW - 18)
  end

  drawCentered("Esq/Dir Jogador   Cima/Baixo Vida", assets.fontSmall, colors.softLilac, 354)
  drawCentered("X Cor   Start Nome   B Novo Jogo", assets.fontSmall, colors.softLilac, 386)
end

local function drawMtg()
  if state.mtgStep == "name" then
    drawMtgNameEditor()
  elseif state.mtgStep == "players" then
    drawMtgPlayers()
  elseif state.mtgStep == "game" then
    drawMtgGame()
  else
    drawMtgMenu()
  end
end

local function drawSettings()
  local now = currentTime()
  local rows = {
    { label = "Hora", value = string.format("%02d", now.hour), part = "hour" },
    { label = "Minuto", value = string.format("%02d", now.min), part = "minute" },
    { label = "Dia", value = string.format("%02d", now.day), part = "day" },
    { label = "Mes", value = string.format("%02d", now.month), part = "month" },
    { label = "Ano", value = string.format("%04d", now.year), part = "year" },
    { label = "Filtro", value = filters[state.colorFilter].name, part = "filter" },
  }

  love.graphics.setColor(colors.panel)
  love.graphics.rectangle("fill", 58, 80, 524, 340)
  love.graphics.setColor(colors.orange)
  love.graphics.setLineWidth(4)
  love.graphics.rectangle("line", 58, 80, 524, 340)

  drawCentered("Config", assets.fontMedium, colors.panelText, 106)
  drawCentered("Hora / Data / Filtro", assets.fontSmall, colors.midPurple, 146)

  local y = 184
  for i, row in ipairs(rows) do
    local selected = i == state.settingsCursor
    love.graphics.setColor(selected and colors.orange or colors.deepPurple)
    love.graphics.rectangle("fill", 122, y - 8, 396, 28)
    drawText(row.label, assets.fontSmall, selected and colors.black or colors.white, 144, y, "left", 160)
    drawText(row.value, assets.fontSmall, selected and colors.black or colors.white, 330, y, "right", 150)
    y = y + 34
  end

  drawCentered("Cima/Baixo Campo   Esq/Dir Muda", assets.fontSmall, colors.midPurple, 384)
  drawCentered("Teste E Volte Na Hora", assets.fontSmall, colors.midPurple, 406)
end

local function drawPlaceholder(screen)
  love.graphics.setColor(colors.panel)
  love.graphics.rectangle("fill", 58, 92, 524, 312)
  love.graphics.setColor(colors.orange)
  love.graphics.setLineWidth(4)
  love.graphics.rectangle("line", 58, 92, 524, 312)

  drawCentered(screen, assets.fontMedium, colors.panelText, 132)

  local y = 204
  for _, line in ipairs(placeholderLines(screen)) do
    drawCentered(line, assets.fontSmall, colors.panelText, y)
    y = y + 34
  end

  drawCentered("A Selecionar   B Voltar", assets.fontSmall, colors.midPurple, 358)
end

local function drawFooter()
  local selected = screens[state.index]
  drawText(selected, assets.fontSmall, colors.orange, 10, 452, "left", 180)
  if selected == "Hora" then
    drawCentered("L1 / Anterior   R1 / Proxima", assets.fontSmall, colors.softLilac, 452)
  elseif selected == "Notas" then
    if state.notesMode == 2 then
      drawText("A Letra B Apaga Y Linha Start / Formato", assets.fontTiny, colors.softLilac, 128, 454, "center", 360)
    elseif state.notesMode == 3 then
      drawText("A Aplica  B Volta", assets.fontTiny, colors.softLilac, 214, 454, "center", 190)
    else
      drawText("A Edita  X Nova  B Apaga", assets.fontTiny, colors.softLilac, 176, 454, "center", 266)
    end
    drawText(clockText(true), assets.fontSmall, colors.orange, 438, 452, "right", 190)
  elseif selected == "To Do" then
    if state.todoMode == 2 then
      drawText("A Letra B Apaga Y Prazo Start / Prior.", assets.fontTiny, colors.softLilac, 124, 454, "center", 370)
    else
      drawText("A Edita X Nova Y Feito Start Filtro", assets.fontTiny, colors.softLilac, 126, 454, "center", 368)
    end
    drawText(clockText(true), assets.fontSmall, colors.orange, 438, 452, "right", 190)
  elseif selected == "Calc" then
    drawText("A Botao  B Apaga  X Limpa  Y Sinal", assets.fontTiny, colors.softLilac, 126, 454, "center", 370)
    drawText(clockText(true), assets.fontSmall, colors.orange, 438, 452, "right", 190)
  elseif selected == "Agenda" then
    if state.agendaMode == 2 then
      drawText("A Letra  B Apaga  OK Volta", assets.fontTiny, colors.softLilac, 150, 454, "center", 318)
    elseif state.agendaMode == 3 then
      drawText("A Novo  B Volta  Esq/Dir Dia", assets.fontTiny, colors.softLilac, 144, 454, "center", 330)
    elseif state.agendaMode == 4 then
      drawText("A Edita  B Apaga  X Volta", assets.fontTiny, colors.softLilac, 158, 454, "center", 306)
    else
      drawText("A Novo  B Eventos  X 3 Dias", assets.fontTiny, colors.softLilac, 150, 454, "center", 318)
    end
    drawText(clockText(true), assets.fontSmall, colors.orange, 438, 452, "right", 190)
  elseif selected == "MTG" then
    if state.mtgStep == "name" then
      drawText("A Letra  B Apaga  OK Volta", assets.fontTiny, colors.softLilac, 150, 454, "center", 318)
    elseif state.mtgStep == "game" then
      drawText("Start Nome  X Cor  B Novo", assets.fontTiny, colors.softLilac, 164, 454, "center", 290)
    else
      drawText("A Confirma  B Volta", assets.fontTiny, colors.softLilac, 190, 454, "center", 230)
    end
    drawText(clockText(true), assets.fontSmall, colors.orange, 438, 452, "right", 190)
  else
    drawText("L1/R1 Abas", assets.fontSmall, colors.softLilac, 218, 452, "center", 170)
    drawText(clockText(true), assets.fontSmall, colors.orange, 438, 452, "right", 190)
  end
end

local function move(delta)
  state.previousIndex = state.index
  state.tabDir = delta < 0 and -1 or 1
  state.tabAnim = 1
  state.index = state.index + delta
  if state.index < 1 then state.index = #screens end
  if state.index > #screens then state.index = 1 end
  saveState()
end

local function selectedScreen()
  return screens[state.index]
end

local function adjustSettings(delta)
  local parts = { "hour", "minute", "day", "month", "year" }
  if state.settingsCursor == 6 then
    state.colorFilter = state.colorFilter + delta
    if state.colorFilter < 1 then state.colorFilter = #filters end
    if state.colorFilter > #filters then state.colorFilter = 1 end
    saveState()
  else
    setCurrentTime(parts[state.settingsCursor], delta)
  end
end

local function handleScreenKey(key)
  local screen = selectedScreen()

  if screen == "Notas" then
    if state.notesMode == 1 then
      if key == "up" then state.notesCursor = math.max(1, state.notesCursor - 1) end
      if key == "down" then state.notesCursor = math.min(math.max(1, state.notes), state.notesCursor + 1) end
      if key == "return" then
        if state.notes == 0 then
          createQuickNote()
        else
          state.notesMode = 2
        end
      end
      if key == "x" then createQuickNote() end
      if key == "escape" then deleteCurrentNote() end
    elseif state.notesMode == 2 then
      local row, col = keyboardPosition(state.keyboardCursor)
      if key == "up" then row = math.max(1, row - 1) end
      if key == "down" then row = math.min(#keyboardRows, row + 1) end
      if key == "left" then col = math.max(1, col - 1) end
      if key == "right" then col = math.min(#keyboardRows[row], col + 1) end
      state.keyboardCursor = keyboardIndex(row, col)
      if key == "return" then
        local keyLabel = keyboardKeys[state.keyboardCursor]
        if keyLabel == "ESP" then
          appendToCurrentNote(" ")
        elseif keyLabel == "OK" then
          state.notesMode = 1
        else
          appendToCurrentNote(keyLabel)
        end
      end
      if key == "escape" then backspaceCurrentNote() end
      if key == "newline" then appendToCurrentNote("\n") end
      if key == "start" then state.notesMode = 3 end
    elseif state.notesMode == 3 then
      if key == "up" then state.formatCursor = math.max(1, state.formatCursor - 1) end
      if key == "down" then state.formatCursor = math.min(#formatActions, state.formatCursor + 1) end
      if key == "return" then applyFormat() end
      if key == "escape" then state.notesMode = 2 end
    end
    clampNotesCursor()
    saveState()
    return
  end

  if screen == "To Do" then
    if state.todoMode == 1 then
      local visible = visibleTodos()
      local selectedPos = 1
      for pos, index in ipairs(visible) do
        if index == state.todoCursor then
          selectedPos = pos
        end
      end

      if key == "up" and #visible > 0 then
        selectedPos = math.max(1, selectedPos - 1)
        state.todoCursor = visible[selectedPos]
      end
      if key == "down" and #visible > 0 then
        selectedPos = math.min(#visible, selectedPos + 1)
        state.todoCursor = visible[selectedPos]
      end
      if key == "return" then
        if state.todos == 0 then
          createTodo()
        else
          state.todoMode = 2
          state.keyboardCursor = 1
        end
      end
      if key == "x" then createTodo() end
      if key == "y" then toggleCurrentTodo(); clampTodoCursor() end
      if key == "start" then cycleTodoFilter() end
      if key == "escape" then deleteCurrentTodo() end
    elseif state.todoMode == 2 then
      local row, col = keyboardPosition(state.keyboardCursor)
      if key == "up" then row = math.max(1, row - 1) end
      if key == "down" then row = math.min(#keyboardRows, row + 1) end
      if key == "left" then col = math.max(1, col - 1) end
      if key == "right" then col = math.min(#keyboardRows[row], col + 1) end
      state.keyboardCursor = keyboardIndex(row, col)
      if key == "return" then
        local keyLabel = keyboardKeys[state.keyboardCursor]
        if keyLabel == "ESP" then
          appendToCurrentTodo(" ")
        elseif keyLabel == "OK" then
          state.todoMode = 1
          clampTodoCursor()
        else
          appendToCurrentTodo(keyLabel)
        end
      end
      if key == "escape" then backspaceCurrentTodo() end
      if key == "y" then cycleTodoDue() end
      if key == "start" then cycleTodoPriority() end
    end
    clampTodoCursor()
    saveState()
    return
  end

  if screen == "Config" then
    if key == "up" then state.settingsCursor = math.max(1, state.settingsCursor - 1) end
    if key == "down" then state.settingsCursor = math.min(6, state.settingsCursor + 1) end
    if key == "left" then adjustSettings(-1) end
    if key == "right" then adjustSettings(1) end
    saveState()
    return
  end

  if screen == "Calc" then
    local row, col = calcPosition(state.calcCursor)
    if key == "up" then row = math.max(1, row - 1) end
    if key == "down" then row = math.min(#calcRows, row + 1) end
    if key == "left" then col = math.max(1, col - 1) end
    if key == "right" then col = math.min(#calcRows[row], col + 1) end
    state.calcCursor = calcIndex(row, col)
    if key == "return" then calcPress(calcKeys[state.calcCursor]) end
    if key == "escape" then calcPress("DEL") end
    if key == "x" then calcPress("C") end
    if key == "y" then calcPress("+/-") end
    saveState()
    return
  end

  if screen == "Timer" then
    if key == "return" then state.timerRunning = 1 - state.timerRunning end
    if state.timerRunning == 0 and key == "left" then
      state.timerPreset = state.timerPreset - 1
      if state.timerPreset < 1 then state.timerPreset = #timerPresets end
      state.timerSeconds = timerPresets[state.timerPreset].seconds
      state.timerLeft = state.timerSeconds
    end
    if state.timerRunning == 0 and key == "right" then
      state.timerPreset = state.timerPreset + 1
      if state.timerPreset > #timerPresets then state.timerPreset = 1 end
      state.timerSeconds = timerPresets[state.timerPreset].seconds
      state.timerLeft = state.timerSeconds
    end
    if state.timerRunning == 0 and key == "up" then
      state.timerPreset = 0
      state.timerSeconds = math.min(5940, state.timerSeconds + 60)
      state.timerLeft = state.timerSeconds
    end
    if state.timerRunning == 0 and key == "down" then
      state.timerPreset = 0
      state.timerSeconds = math.max(60, state.timerSeconds - 60)
      state.timerLeft = state.timerSeconds
    end
    if key == "escape" then state.timerRunning = 0; state.timerLeft = state.timerSeconds end
    saveState()
    return
  end

  if screen == "Agenda" then
    if state.agendaMode == 1 then
      local _, year, month = selectedAgendaDate()
      local total = daysInMonth(year, month)
      local delta = 0
      if key == "left" then delta = -1 end
      if key == "right" then delta = 1 end
      if key == "up" then delta = -7 end
      if key == "down" then delta = 7 end
      if delta ~= 0 then
        state.calendarSelectedDay = state.calendarSelectedDay + delta
        while state.calendarSelectedDay < 1 do
          state.calendarMonthOffset = state.calendarMonthOffset - 1
          local prevYear, prevMonth = shiftedMonth(state.calendarMonthOffset)
          state.calendarSelectedDay = daysInMonth(prevYear, prevMonth) + state.calendarSelectedDay
        end
        while state.calendarSelectedDay > total do
          state.calendarSelectedDay = state.calendarSelectedDay - total
          state.calendarMonthOffset = state.calendarMonthOffset + 1
          local nextYear, nextMonth = shiftedMonth(state.calendarMonthOffset)
          total = daysInMonth(nextYear, nextMonth)
        end
      end
      if key == "return" then createEventForSelectedDate() end
      if key == "x" then state.agendaMode = 3 end
      if key == "escape" then
        if selectFirstEventForDate(selectedAgendaDate()) then
          state.agendaMode = 4
        else
          state.calendarMonthOffset = 0
        end
      end
    elseif state.agendaMode == 2 then
      local row, col = keyboardPosition(state.keyboardCursor)
      if key == "up" then row = math.max(1, row - 1) end
      if key == "down" then row = math.min(#keyboardRows, row + 1) end
      if key == "left" then col = math.max(1, col - 1) end
      if key == "right" then col = math.min(#keyboardRows[row], col + 1) end
      state.keyboardCursor = keyboardIndex(row, col)
      if key == "return" then
        local keyLabel = keyboardKeys[state.keyboardCursor]
        if keyLabel == "ESP" then
          appendToCurrentEvent(" ")
        elseif keyLabel == "OK" then
          state.agendaMode = 1
        else
          appendToCurrentEvent(keyLabel)
        end
      end
      if key == "escape" then backspaceCurrentEvent() end
    elseif state.agendaMode == 3 then
      if key == "return" then createEventForSelectedDate() end
      if key == "escape" or key == "x" then state.agendaMode = 1 end
      if key == "left" then setAgendaSelectedDate(addDaysToKey(selectedAgendaDate(), -1)) end
      if key == "right" then setAgendaSelectedDate(addDaysToKey(selectedAgendaDate(), 1)) end
    elseif state.agendaMode == 4 then
      local keyDate = selectedAgendaDate()
      local pos, indexes = selectedEventPositionForDate(keyDate)
      if key == "up" and #indexes > 0 then
        pos = math.max(1, pos - 1)
        state.agendaCursor = indexes[pos]
      end
      if key == "down" and #indexes > 0 then
        pos = math.min(#indexes, pos + 1)
        state.agendaCursor = indexes[pos]
      end
      if key == "return" then
        if #indexes == 0 then
          createEventForSelectedDate()
        else
          state.agendaMode = 2
          state.keyboardCursor = 1
        end
      end
      if key == "escape" and #indexes > 0 then
        deleteCurrentEvent()
        if not selectFirstEventForDate(keyDate) then
          state.agendaMode = 1
        end
      end
      if key == "x" then state.agendaMode = 1 end
    end
    saveState()
    return
  end

  if screen == "MTG" then
    if state.mtgStep == "menu" then
      if key == "up" or key == "down" or key == "left" or key == "right" then state.mtgChoice = state.mtgChoice == 1 and 2 or 1 end
      if key == "return" then
        state.mtgPlayers = 1
        state.mtgStep = "players"
      end
    elseif state.mtgStep == "players" then
      if key == "left" then state.mtgPlayers = math.max(1, state.mtgPlayers - 1) end
      if key == "right" then state.mtgPlayers = math.min(6, state.mtgPlayers + 1) end
      if key == "return" then startMtgGame() end
      if key == "escape" then state.mtgStep = "menu" end
    elseif state.mtgStep == "name" then
      local row, col = keyboardPosition(state.keyboardCursor)
      if key == "up" then row = math.max(1, row - 1) end
      if key == "down" then row = math.min(#keyboardRows, row + 1) end
      if key == "left" then col = math.max(1, col - 1) end
      if key == "right" then col = math.min(#keyboardRows[row], col + 1) end
      state.keyboardCursor = keyboardIndex(row, col)
      if key == "return" then
        local keyLabel = keyboardKeys[state.keyboardCursor]
        if keyLabel == "ESP" then
          appendToMtgName(" ")
        elseif keyLabel == "OK" then
          state.mtgStep = "game"
        else
          appendToMtgName(keyLabel)
        end
      end
      if key == "escape" then backspaceMtgName() end
    elseif state.mtgStep == "game" then
      if state.mtgChoice == 2 and state.mtgPlayers == 1 then
        if key == "left" then state.mtgCommanderSlot = state.mtgCommanderSlot - 1 end
        if key == "right" then state.mtgCommanderSlot = state.mtgCommanderSlot + 1 end
        if state.mtgCommanderSlot < 0 then state.mtgCommanderSlot = 3 end
        if state.mtgCommanderSlot > 3 then state.mtgCommanderSlot = 0 end
        if state.mtgCommanderSlot == 0 then
          if key == "up" then setMtgLife(1, mtgLife(1) + 1) end
          if key == "down" then setMtgLife(1, mtgLife(1) - 1) end
        else
          if key == "up" then adjustCommanderDamage(state.mtgCommanderSlot, 1) end
          if key == "down" then adjustCommanderDamage(state.mtgCommanderSlot, -1) end
        end
      else
        if key == "left" then state.mtgSelectedPlayer = state.mtgSelectedPlayer - 1 end
        if key == "right" then state.mtgSelectedPlayer = state.mtgSelectedPlayer + 1 end
        if state.mtgSelectedPlayer < 1 then state.mtgSelectedPlayer = state.mtgPlayers end
        if state.mtgSelectedPlayer > state.mtgPlayers then state.mtgSelectedPlayer = 1 end
        if key == "up" then setMtgLife(state.mtgSelectedPlayer, mtgLife(state.mtgSelectedPlayer) + 1) end
        if key == "down" then setMtgLife(state.mtgSelectedPlayer, mtgLife(state.mtgSelectedPlayer) - 1) end
      end
      if key == "color" then cycleMtgColor(state.mtgSelectedPlayer) end
      if key == "start" then state.mtgStep = "name"; state.keyboardCursor = 1 end
      if key == "escape" then state.mtgStep = "menu" end
      state.mtgP1 = mtgLife(1)
      state.mtgP2 = mtgLife(2)
    end
    saveState()
  end
end

local function handleAnalog(dt)
  state.analogCooldown = math.max(0, state.analogCooldown - dt)
  if state.analogCooldown > 0 then
    return
  end

  local threshold = 0.55
  local key = nil
  if math.abs(state.analogX) > math.abs(state.analogY) and math.abs(state.analogX) > threshold then
    key = state.analogX < 0 and "left" or "right"
  elseif math.abs(state.analogY) > threshold then
    key = state.analogY < 0 and "up" or "down"
  end

  if key then
    handleScreenKey(key)
    state.analogCooldown = 0.22
  end
end

local function handleButton(button)
  if state.buttonCooldown > 0 then
    return
  end

  if button == "a" then
    handleScreenKey("return")
  elseif button == "b" then
    if selectedScreen() ~= "Notas" and selectedScreen() ~= "To Do" and selectedScreen() ~= "Calc" and selectedScreen() ~= "Agenda" and selectedScreen() ~= "Timer" and selectedScreen() ~= "MTG" then
      handleScreenKey("escape")
    end
  elseif button == "x" then
    if selectedScreen() == "MTG" and state.mtgStep == "game" then
      handleScreenKey("color")
    elseif selectedScreen() == "Notas" or selectedScreen() == "To Do" then
      handleScreenKey("x")
    elseif selectedScreen() == "Calc" then
      handleScreenKey("x")
    elseif selectedScreen() == "Agenda" then
      handleScreenKey("x")
    else
      handleScreenKey("left")
    end
  elseif button == "y" then
    if selectedScreen() == "Notas" and state.notesMode == 2 then
      handleScreenKey("newline")
    elseif selectedScreen() == "To Do" then
      handleScreenKey("y")
    elseif selectedScreen() == "Calc" then
      handleScreenKey("y")
    else
      handleScreenKey("right")
    end
  elseif button == "start" then
    if selectedScreen() == "Notas" and state.notesMode == 2 then
      handleScreenKey("start")
    end
  else
    return
  end

  state.buttonCooldown = 0.18
end

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.window.setMode(screenW, screenH, { fullscreen = false, resizable = false })

  assets.wallpaper = love.graphics.newImage("assets/wallpapers/galaxy.png")
  assets.fontTiny = projectFont(9)
  assets.fontSmall = projectFont(11)
  assets.fontMedium = projectFont(18)
  assets.fontCalc = projectFont(32)
  assets.fontLarge = projectFont(58)
  assets.fontClock = projectFont(104)

  loadState()
  state.index = 1
  state.notesMode = 1
  state.todoMode = 1
  state.agendaMode = 1
  if state.mtgStep == "name" then
    state.mtgStep = "game"
  end
end

function love.update(dt)
  state.buttonCooldown = math.max(0, state.buttonCooldown - dt)
  state.tabAnim = math.max(0, state.tabAnim - dt * 5)
  handleAnalog(dt)

  if state.timerRunning == 1 and state.timerLeft > 0 then
    state.timerAccumulator = (state.timerAccumulator or 0) + dt
    while state.timerAccumulator >= 1 and state.timerLeft > 0 do
      state.timerLeft = state.timerLeft - 1
      state.timerAccumulator = state.timerAccumulator - 1
    end
    if state.timerLeft <= 0 then
      state.timerRunning = 0
      state.timerLeft = 0
      saveState()
    end
  end
end

local function drawScreen(selected)
  if selected == "Hora" then
    drawClock()
  elseif selected == "Notas" then
    drawNotes()
  elseif selected == "To Do" then
    drawTodo()
  elseif selected == "Agenda" then
    drawCalendar()
  elseif selected == "Calc" then
    drawCalc()
  elseif selected == "Timer" then
    drawTimer()
  elseif selected == "MTG" then
    drawMtg()
  elseif selected == "Config" then
    drawSettings()
  else
    drawPlaceholder(selected)
  end
end

function love.draw()
  local selected = screens[state.index]
  drawBackground()
  drawTopBar()

  if state.tabAnim > 0 and state.previousIndex ~= state.index then
    local t = state.tabAnim
    local offset = math.floor(t * 42)
    love.graphics.push()
    love.graphics.translate(-state.tabDir * offset, 0)
    drawScreen(selected)
    love.graphics.pop()
  else
    drawScreen(selected)
  end

  drawFooter()
end

function love.keypressed(key)
  if key == "q" or key == "pageup" then move(-1) end
  if key == "e" or key == "pagedown" then move(1) end
  if key == "f1" then handleScreenKey("start") end
  if key == "f3" then handleScreenKey("escape") end
  if key == "up" or key == "down" or key == "left" or key == "right" or key == "return" or key == "escape" or key == "x" then
    handleScreenKey(key)
  end
end

function love.gamepadpressed(_, button)
  handleButton(button)
end

function love.joystickaxis(_, axis, value)
  if axis == 1 or axis == 3 then
    state.analogX = math.abs(value) > 0.20 and value or 0
  elseif axis == 2 or axis == 4 then
    state.analogY = math.abs(value) > 0.20 and value or 0
  end
end

function love.quit()
  saveState()
end
