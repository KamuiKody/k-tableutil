if Config.Framework == 'standalone' then
  framework = false
elseif Config.Framework == 'qbcore' then
  local QBCore = exports['qb-core']:GetCoreObject()
  framework = true
end

RegisterServerEvent("k-uitl:printVector", function(type, message, location, heading)
  file = io.open('tableutil.txt', "a")
  io.output(file)
  if type == 'v3' then
    output = parseV3(location)
  elseif type == 'v4' then
    output = parseV4(location, heading)
  elseif type == 'next' then
    output = parseNext()
  elseif type == 'end' then
    output = parseEnd()
  elseif type == 'start' then
    output = parseStart(message)
  end
  io.write(output)
  io.close(file)
  if framework then
    local src = source
    TriggerClientEvent('QBCore:Notify', src, 'You submitted a table entry.', "success")
  end
end)

function parseStart(message)
  local printout = ''
  printout = printout .. "\n [".. message .."] = {"
  return printout
end

function parseNext()
  local printout = ''
    printout = printout .. "\n },"
  return printout
end

function parseEnd()
  local printout = ''
    printout = printout .. "\n }"
  return printout
end

function parseV3(location)
  local printout = ''
  printout = printout .. "\n " .. tostring(location) .. ","
  return printout
end

function parseV4(location, heading)
  local printout = ''
  printout = printout .. "\n {coords = " .. tostring(location) .. ", heading = " .. tostring(heading) .. "},"
  return printout
end