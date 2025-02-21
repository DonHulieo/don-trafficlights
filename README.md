# don-trafficlights

Traffic Lights Logic for FiveM! This is a paid script, available on my [Tebex](https://dons-developments.tebex.io/package/5370160).

## Features

- Optimised code, resmon of 0~0.01ms. Peaking for civilians when stopped at lights and when LEO's have sirens on near traffic lights.
- Config Option for ESX or QBCore!
- Set the duration of traffic lights for players, lights will turn green after car has been stopped for the duration.
- Traffic Lights go green if player is an LEO and has sirens on.
- Local traffic now see's the updated signals, and will drive when the light turns green and halt when the light turns red.

## Table of Contents

- [don-trafficlights](#don-trafficlights)
  - [Features](#features)
  - [Table of Contents](#table-of-contents)
    - [Preview](#preview)
    - [Installation](#installation)
      - [Dependencies](#dependencies)
      - [Initial Setup](#initial-setup)
    - [Exports](#exports)
      - [getglobalstate](#getglobalstate)
      - [setglobalstate](#setglobalstate)
      - [setlightstates](#setlightstates)
      - [setclientstate](#setclientstate)
    - [Configuration](#configuration)
      - [Debug Mode](#debug-mode)
      - [EMS Priority](#ems-priority)
      - [Search](#search)
      - [Duration](#duration)
      - [Allowed Jobs](#allowed-jobs)
    - [Support](#support)
    - [Changelog](#changelog)

### Preview

- [don-trafficlights](https://www.youtube.com/watch?v=xx_WiEObrHk)
- [don-trafficlights v1.1](https://streamable.com/1a4gll)

### Installation

#### Dependencies

**This script requires the following script to be installed:**

- [duff](https://github.com/DonHulieo/duff)

#### Initial Setup

- Always use the latest FiveM artifacts (tested on 6683), you can find them [here](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/).
- Download the latest version from your keymaster.
- Extract the contents of the zip file into your resources folder, into a folder which starts after your framework & `duff` or;
- Ensure the script in your `server.cfg` after your framework & `duff`.
- Configure `shared/config.lua` to your liking, see [Configuration](#configuration) for more information.

**Note:** This script automatically configures it's Core functions to work with your framework.

### Exports

#### getglobalstate

A server export to get the Global State of whether light changes are enabled or not.

```lua
---@return boolean enabled
GlobalState['trafficlights:enabled']

exports['don-trafficlights']:getglobalstate()
```

- `returns: boolean` enabled, whether light changes are enabled or not.

#### setglobalstate

A server export to set the Global State of whether light changes are enabled or not.

```lua
---@param state boolean
GlobalState['trafficlights:enabled'] = state

exports['don-trafficlights']:setglobalstate(state)
```

- `state`, whether light changes are enabled or not.

#### setlightstates

A server export to set the light states for a player or position.

```lua
---@param position vector4
---@param intersection_lights {[1]: number, [2]: number, [3]: number, heading: number, model: number}[]
---@param intersection_centre vector3
---@param is_leo boolean
exports['don-trafficlights']:setlightstates(position, intersection_lights, intersection_centre, is_leo)
```

- `position`, the position of the player or trigger point.
- `intersection_lights`, the array of lights to be set.
  - `[1]`, the x coordinate of the light.
  - `[2]`, the y coordinate of the light.
  - `[3]`, the z coordinate of the light.
  - `heading`, the heading of the light.
  - `model`, the model of the light.
- `intersection_centre`, the centre of the intersection.
- `is_leo`, whether the player is an LEO or not.

#### setclientstate

A client export to set whether light changes are enabled or not.

```lua
---@param state boolean
exports['don-trafficlights']:setclientstate(state)
```

- `state`, whether light changes are enabled or not.

### Configuration

#### Debug Mode

```lua
['DebugMode'] = false
```

- `DebugMode` boolean, whether to show debug messages in the console & draw markers on affected vehicles and lights

#### EMS Priority

```lua
['EMSPriority'] = true
```

- `EMSPriority` boolean, whether or not to give priority to EMS vehicles when they have their sirens on.

#### Search

```lua
['Search'] = {
  ['Lights'] = {
    enabled = true,
    distance = 80.0,
    headingThres = 45.0,
    max = 8
  },
  ['Vehicles'] = {
    enabled = true,
    distance = 80.0,
    headingThres = 15.0,
    max = 16
  }
}
```

- `['Lights'].enabled` boolean, whether or not to search for traffic lights.
- `['Lights'].distance` float, the max distance to search for traffic lights.
- `['Lights'].headingThres` float, the threshold for the heading difference between player and the traffic light.
- `['Lights'].max` integer, the max amount of lights to set at once.
- `['Vehicles'].enabled` boolean, whether or not to search for vehicles (This has a performance impact based on the amount of vehicles in the area).
- `['Vehicles'].distance` float, the max distance to search for vehicles.
- `['Vehicles'].headingThres` float, the threshold for the heading difference between the vehicles and the traffic light.
- `['Vehicles'].max` integer, the max amount of vehicles to set at once.
  
**Note:** The vehicle search feature is can be quite intensive depending on the amount of vehicles in the area, it is recommended to keep this disabled if you're not using it, or tweaking the values to both your liking and server performance.

#### Duration

```lua
['Duration'] = 4500,
```

- `['Duration']` integer, the duration in milliseconds between each traffic light state.

#### Allowed Jobs

```lua
['AllowedJobs'] = {'police', 'fib', 'sheriff', 'ambulance', 'fire'}
```

- `AllowedJobs` string|string[], the jobs that are allowed to trigger the light changes.

### Support

- Join my [discord](https://discord.gg/tVA58nbBuk) and use the relative support channels.
- Open a ticket and please have your Tebex Transation ID ready 🙂.

### Changelog

- v1.2.2 - Even further fixes for intermittent issues when changing lights, spefically with debug mode disabled and non-LEO players.
- v1.2.1 - Further fixes for users on dedicated servers, elimating issues relating to network connection and packet loss.
- v1.2.0 - Bug fixes for retreiving lights to be set, Added Global Dis/Enable for Lights & AI Changes and Added Exports for Light Changes.
- v1.1.9 - Added `kdtree` usage for faster light retrieval, changed functionality to use GlobalStates for better syncing across players and changed duration to be more intuitive.
- v1.1.8 - Added more configurable options for light timings.
- v1.1.7 - Optimised retrieval of vehicles and lights and support updates for [duff](https://github.com/DonHulieo/duff).
- v1.1.6 - Support updates for [duff](https://github.com/DonHulieo/duff).
- v1.1.5 - Fixed Traffic Light Syncing Issue & Add [duff](https://github.com/DonHulieo/duff) as a dependency.
- v1.1.4 - Removed Scoped Events in Favour of Manual Distance Checking to Improve Syncing between Players.
- v1.1.3 - Added Scoped Events for Triggering Light Changes, Improve Annotations and Implemented Version Checker from Gifts and Patrols.
- v1.1.2 - Fixed Max Lights and Vehicles Being Set Beyond Config Limits, Variable Linting and Auto Framework Detection.
- v1.1.1 - Localised functions, Changed the Config Further for More Options and Accessibility, Finalised Lua Documentation and Fixed Light Syncing Issue.
- v1.1.0 - Large Code Refactor, Uses GamePools to find Entities, Rewrote Config to Be More Readable, Vehicles Facing Red Lights Now Stop and Added Config Option to Turn Off Vehicle Search.
- v1.0.9 - Refactor Code in Preparation for v1.1.0
- v1.0.8 - Optimised the traffic light search function, now lights facing away from the player will be turned red.
- v1.0.7 - Added Standalone option // Can be used without ESX or QBCore
- v1.0.6 - Changed the Config option for ESX to be the same as QBCore, now you can add as many jobs as you want.
- v1.0.5 - Added Sheriff and Highway as job titles for ESX
- v1.0.4 Added Config option for ESX, job check currently setup for police, ambulance and fire, use Config.JobCheck to set the job checks respectively.
- v1.0.3 Added amber light to smooth transitions when player leaving intersection area // server synced
- v1.0.2 Local traffic listens to the updated signals // server synced
- v1.0.1 Added Config.JobCheck so users aren't forced to only use FirstResponders.
