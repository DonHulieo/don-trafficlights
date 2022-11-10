Config = {}

Config.Framework = 'ESX' -- 'ESX' or 'QBCore'

Config.TrafficLights = {
    search = {
        step = 10.0, 
        minDist = 20.0,
        maxDist = 60.0,
        rad = 10.0,
        headingThres = 40.0
    },
    duration = {
        civCheckTime = 3000,
        leoCheckTime = 1000,
        lightTime = 3500,
        leoLightTime = 7500 
    }
}

Config.JobCheck = 'FirstResponder' -- Set to either LEO, EMS or FirstResponder to change what jobs declared below, trigger a light change

if Config.Framework == 'QBCore' then
    local QBCore = exports['qb-core']:GetCoreObject()
    Config.AuthorizedJobs = {
        LEO = { -- this is for job checks which should only return true for police officers
            Jobs = {['police'] = true, ['fib'] = true, ['sheriff'] = true},
            Types = {['police'] = true, ['leo'] = true},
            Check = function()
                local PlyData = QBCore.Functions.GetPlayerData()
                local job, jobtype = PlyData.job.name, PlyData.job.type

                if Config.AuthorizedJobs.LEO.Jobs[job] or Config.AuthorizedJobs.LEO.Types[jobtype] then return true end
            end
        },
        EMS = { -- this if for job checks which should only return true for ems workers
            Jobs = {['ambulance'] = true, ['fire'] = true},
            Types = {['ambulance'] = true, ['fire'] = true, ['ems'] = true},
            Check = function()
                local PlyData = QBCore.Functions.GetPlayerData()
                local job, jobtype = PlyData.job.name, PlyData.job.type

                if Config.AuthorizedJobs.EMS.Jobs[job] or Config.AuthorizedJobs.EMS.Types[jobtype] then return true end
            end
        },
        FirstResponder = { -- do not touch, this is a combined job checking function for emergency services (police and ems)
            Check = function()
                local PlyData = QBCore.Functions.GetPlayerData()
                local job, jobtype = PlyData.job.name, PlyData.job.type

                if Config.AuthorizedJobs.LEO.Check(jobtype, job) or Config.AuthorizedJobs.EMS.Check(jobtype, job) then return true end            
            end
        }
    }
end