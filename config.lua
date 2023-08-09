Config = {}

Config.Framework = 'QBCore' -- 'ESX' or 'QBCore' or 'None' (if you want to use this script without any job checks and just use the siren to trigger the lights)

Config.TrafficLights = {
    search = {
        maxDist = 60.0, -- Max distance to search for traffic lights
        headingThres = 40.0, -- The threshold for the heading difference between player and the traffic light
        maxLights = 4, -- Max amount of lights to set at once
    },
    duration = {
        civCheckTime = 500, -- Time in ms to check for traffic lights as a civilian
        leoCheckTime = 500, -- Time in ms to check for traffic lights as a leo
        lightTime = 3500, -- Time in ms until the light changes
        leoLightTime = 7500,  -- Time in ms until the light changes for leo light changes
    },
}

Config.JobCheck = 'FirstResponder' -- Set to either LEO, EMS or FirstResponder to change what jobs declared below, trigger a light change


--------------------------- ADD YOUR RELEVANT EMS JOBS HERE // DO NOT TOUCH THE FIRST RESPONDER SECTION ---------------------------
Config.AuthorizedJobs = {
    LEO = { -- this is for job checks which should only return true for police officers
        Jobs = {['police'] = true, ['fib'] = true, ['sheriff'] = true},
        Types = {['police'] = true, ['leo'] = true},
        Check = function(PlyData)
            PlyData = PlyData or GetPlayerData()
            if not PlyData or (PlyData and (not PlyData.job or not PlyData.job.type))  then return false end
            local job, jobtype = PlyData.job.name, PlyData.job.type
            if Config.AuthorizedJobs.LEO.Jobs[job] or Config.AuthorizedJobs.LEO.Types[jobtype] then return true end
        end
    },
    EMS = { -- this if for job checks which should only return true for ems workers
        Jobs = {['ambulance'] = true, ['fire'] = true},
        Types = {['ambulance'] = true, ['fire'] = true, ['ems'] = true},
        Check = function(PlyData)
            PlyData = PlyData or GetPlayerData()
            if not PlyData or (PlyData and (not PlyData.job or not PlyData.job.type))  then return false end
            local job, jobtype = PlyData.job.name, PlyData.job.type
            if Config.AuthorizedJobs.EMS.Jobs[job] or Config.AuthorizedJobs.EMS.Types[jobtype] then return true end
        end
    },
    FirstResponder = { -- do not touch, this is a combined job checking function for emergency services (police and ems)
        Check = function(PlyData)
            PlyData = PlyData or GetPlayerData()
            if not PlyData or (PlyData and (not PlyData.job or not PlyData.job.type))  then return false end
            local job, jobtype = PlyData.job.name, PlyData.job.type
            if Config.AuthorizedJobs.LEO.Check(PlyData, jobtype, job) or Config.AuthorizedJobs.EMS.Check(PlyData, jobtype, job) then return true end            
        end
    }
}
------------------------------------------------------------------------------------------------------------------------------