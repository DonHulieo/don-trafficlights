Config = {}

Config.Framework = 'QBCore' -- 'ESX' or 'QBCore' or 'None' (if you want to use this script without any job checks and just use the siren to trigger the lights)
Config.JobCheck = 'FirstResponder' -- Set to either LEO, EMS or FirstResponder to change what jobs declared below, trigger a light change
Config.DebugMode = false -- Set to true to enable debug mode (This will spam your console with debug messages, also draws a marker above affected vehicles and lights)

Config.Search = {
    lightDist = 80.0, -- Max distance to search for traffic lights
    vehicles = true, -- Whether or not to search for vehicles (This has a high performance impact)
    vehDist = 80.0, -- Max distance to search for vehicles
    headingThres = 45.0, -- The threshold for the heading difference between player and the traffic light
    maxLights = 8, -- Max amount of lights to set at once
    maxVehicles = 16 -- Max amount of vehicles to set at once
}

Config.Duration = {
    civCheckTime = 1000, -- Time in ms to check for traffic lights as a civilian
    leoCheckTime = 500, -- Time in ms to check for traffic lights as a leo
    lightTime = 3500, -- Time in ms until the light changes
    leoLightTime = 7500  -- Time in ms until the light changes for leo light changes
}

--------------------------- ADD YOUR RELEVANT EMS JOBS HERE // DO NOT TOUCH THE FIRST RESPONDER SECTION ---------------------------
Config.AuthorizedJobs = {
    LEO = { -- this is for job checks which should only return true for police officers
        Jobs = {['police'] = true, ['fib'] = true, ['sheriff'] = true},
        Types = {['police'] = true, ['leo'] = true},
        Check = function(PlyData, job, jobType)
            PlyData = PlyData or GetPlayerData()
            if not PlyData or (PlyData and (not PlyData.job or not PlyData.job.type))  then return false end
            job, jobType = job or PlyData.job.name, jobType or PlyData.job.type
            if Config.AuthorizedJobs.LEO.Jobs[job] or Config.AuthorizedJobs.LEO.Types[jobType] then return true end
        end
    },
    EMS = { -- this if for job checks which should only return true for ems workers
        Jobs = {['ambulance'] = true, ['fire'] = true},
        Types = {['ambulance'] = true, ['fire'] = true, ['ems'] = true},
        Check = function(PlyData, job, jobType)
            PlyData = PlyData or GetPlayerData()
            if not PlyData or (PlyData and (not PlyData.job or not PlyData.job.type))  then return false end
            job, jobType = job or PlyData.job.name, jobType or PlyData.job.type
            if Config.AuthorizedJobs.EMS.Jobs[job] or Config.AuthorizedJobs.EMS.Types[jobType] then return true end
        end
    },
    FirstResponder = { -- do not touch, this is a combined job checking function for emergency services (police and ems)
        Check = function(PlyData)
            PlyData = PlyData or GetPlayerData()
            if not PlyData or (PlyData and (not PlyData.job or not PlyData.job.type))  then return false end
            local job, jobType = PlyData.job.name, PlyData.job.type
            if Config.AuthorizedJobs.LEO.Check(PlyData, job, jobType) or Config.AuthorizedJobs.EMS.Check(PlyData, job, jobType) then return true end
        end
    }
}
------------------------------------------------------------------------------------------------------------------------------
