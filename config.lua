return {
  ---@type boolean Whether to show debug messages in the console & draw markers on affected vehicles and lights
  ['DebugMode'] = false,
  ---@type {Lights: {enabled: boolean, distance: number, headingThres: number, max: integer}, Vehicles: {enabled: boolean, distance: number, headingThres: number, max: integer}}
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
  ---@type {Civ: {check: integer, wait: integer, light: integer}, LEO: {check: integer, wait: integer, light: integer}}
  ['Duration'] = { -- Times in ms
    ['Civ'] = {
      check = 1000, -- The time between checks for traffic lights
      wait = 3000, -- The wait time before initiating the light change
      light = 3500 -- The duration of each light change
    },
    ['LEO'] = {
      check = 500, -- The time between checks for traffic lights
      wait = 3000, -- The wait time before initiating the light change
      light = 7500 -- The duration of each light change
    }
  },
  ---@type {AllowedJobs: string[]} Add your relevant jobs here to allow them to change the lights
  ['AllowedJobs'] = {'police', 'fib', 'sheriff', 'ambulance', 'fire'}
}