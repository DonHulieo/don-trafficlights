return {
  ---@type boolean Whether to show debug messages in the console & draw markers on affected vehicles and lights
  ['DebugMode'] = false,
  ---@type {Lights: {enabled: boolean, distance: number, headingThres: number, max: number}, Vehicles: {enabled: boolean, distance: number, headingThres: number, max: number}}
  ['Search'] = {
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
  },
  ---@type {Civ: {checkTime: number, lightTime: number}, LEO: {checkTime: number, lightTime: number}}
  ['Duration'] = {
    ['Civ'] = {
      checkTime = 1000, -- Time in ms to check for traffic lights as a civilian
      lightTime = 3500 -- Time in ms until the light changes
    },
    ['LEO'] = {
      checkTime = 500, -- Time in ms to check for traffic lights as a leo
      lightTime = 7500 -- Time in ms until the light changes for leo light changes
    }
  },
  ---@type {AllowedJobs: string[]} Add your relevant jobs here to allow them to change the lights
  ['AllowedJobs'] = {'police', 'fib', 'sheriff', 'ambulance', 'fire'}
}