Config = {}

Config.JobCheck = 'FirstResponder' -- Set to either LEO, EMS or FirstResponder to change what jobs declared below, trigger a light change
Config.DebugMode = false -- Set to true to enable debug mode (This will spam your console with debug messages, also draws a marker above affected vehicles and lights)

Config.Search = {
  ['Lights'] = {
    enabled = true, -- Whether or not to search for traffic lights
    distance = 80.0, -- Max distance to search for traffic lights
    headingThres = 45.0, -- The threshold for the heading difference between player and the traffic light
    max = 8 -- Max amount of lights to set at once
  },
  ['Vehicles'] = {
    enabled = true, -- Whether or not to search for vehicles (This has a performance impact based on the amount of vehicles in the area)
    distance = 80.0, -- Max distance to search for vehicles
    headingThres = 15.0, -- The threshold for the heading difference between the vehicles and the traffic light
    max = 16 -- Max amount of vehicles to set at once
  }
}

Config.Duration = {
  ['Civ'] = {
    checkTime = 1000, -- Time in ms to check for traffic lights as a civilian
    lightTime = 3500 -- Time in ms until the light changes
  },
  ['LEO'] = {
    checkTime = 500, -- Time in ms to check for traffic lights as a leo
    lightTime = 7500 -- Time in ms until the light changes for leo light changes
  }
}

--------------------------- ADD YOUR RELEVANT EMS JOBS HERE // DO NOT TOUCH THE FIRST RESPONDER SECTION ---------------------------
Config.AuthorisedJobs = {
  LEO = { -- this is for job checks which should only return true for police officers
    Jobs = {['police'] = true, ['fib'] = true, ['sheriff'] = true},
    Types = {['police'] = true, ['leo'] = true},
    ---@param PlyData table
    ---@param job string
    ---@param jobType string
    ---@return boolean isLEO
    Check = function(PlyData, job, jobType)
      PlyData = PlyData or GetPlayerData()
      if not PlyData or (PlyData and (not PlyData.job or not PlyData.job.type))  then return false end
      job, jobType = job or PlyData.job.name, jobType or PlyData.job.type
      return Config.AuthorisedJobs.LEO.Jobs[job] or Config.AuthorisedJobs.LEO.Types[jobType]
    end
  },
  EMS = { -- this if for job checks which should only return true for ems workers
    Jobs = {['ambulance'] = true, ['fire'] = true},
    Types = {['ambulance'] = true, ['fire'] = true, ['ems'] = true},
    ---@param PlyData table
    ---@param job string
    ---@param jobType string
    ---@return boolean isEMS
    Check = function(PlyData, job, jobType)
      PlyData = PlyData or GetPlayerData()
      if not PlyData or (PlyData and (not PlyData.job or not PlyData.job.type))  then return false end
      job, jobType = job or PlyData.job.name, jobType or PlyData.job.type
      return Config.AuthorisedJobs.EMS.Jobs[job] or Config.AuthorisedJobs.EMS.Types[jobType]
    end
  },
  FirstResponder = { -- do not touch, this is a combined job checking function for emergency services (police and ems)
    ---@param PlyData table
    ---@return boolean isFirstResponder
    Check = function(PlyData)
      PlyData = PlyData or GetPlayerData()
      if not PlyData or (PlyData and (not PlyData.job or not PlyData.job.type))  then return false end
      local job, jobType = PlyData.job.name, PlyData.job.type
      return Config.AuthorisedJobs.LEO.Check(PlyData, job, jobType) or Config.AuthorisedJobs.EMS.Check(PlyData, job, jobType)
    end
  }
}
------------------------------------------------------------------------------------------------------------------------------
