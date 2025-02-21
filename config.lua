return {
  ---@type boolean Whether to show debug messages in the console & draw markers on affected vehicles and lights
  ['DebugMode'] = false,
  ---@type boolean Whether to allow EMS/LEO traffic light priority.
  ['EMSPriority'] = true,
  ---@type {Lights: {enabled: boolean, distance: number, headingThres: number, max: integer}, Vehicles: {enabled: boolean, distance: number, headingThres: number, max: integer}}
  ['Search'] = {
    ['Lights'] = {
      enabled = true, -- Whether or not to search for traffic lights
      distance = 60.0, -- Max distance to search for traffic lights
      headingThres = 30.0, -- The threshold for the heading difference between player and the traffic light
      max = 8 -- Max amount of lights to set at once
    },
    ['Vehicles'] = {
      enabled = true, -- Whether or not to search for vehicles (This has a performance impact based on the amount of vehicles in the area)
      distance = 60.0, -- Max distance to search for vehicles
      headingThres = 25.0, -- The threshold for the heading difference between the vehicles and the traffic light
      max = 32 -- Max amount of vehicles to set at once
    }
  },
  ---@type integer The time (ms) between traffic light states
  ['Duration'] = 4500,
  ---@type {AllowedJobs: string[]} Add your relevant jobs here to allow them to change the lights
  ['AllowedJobs'] = {'police', 'fib', 'sheriff', 'ambulance', 'fire'}
}