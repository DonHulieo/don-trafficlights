# don-trafficlights

Traffic Lights Logic for QBCore! This is a paid script, available on my [Tebex](https://dons-developments.tebex.io/package/5370160).

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
    - [Configuration](#configuration)
      - [Debug Mode](#debug-mode)
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

### Configuration

#### Debug Mode

```lua
['DebugMode'] = false
```

- `DebugMode` boolean, whether to show debug messages in the console & draw markers on affected vehicles and lights

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
['Duration'] = {
  ['Civ'] = {
    checkTime = 1000,
    lightTime = 3500
  },
  ['LEO'] = {
    checkTime = 500,
    lightTime = 7500
  }
}
```

- `['Civ'].checkTime` integer, the time in ms to check for traffic lights as a civilian.
- `['Civ'].lightTime` integer, the time in ms until the light changes.
- `['LEO'].checkTime` integer, the time in ms to check for traffic lights as a LEO.
- `['LEO'].lightTime` integer, the time in ms until the light changes for LEO light changes.

#### Allowed Jobs

```lua
['AllowedJobs'] = {'police', 'fib', 'sheriff', 'ambulance', 'fire'}
```

- `AllowedJobs` string|string[], the jobs that are allowed to trigger the light changes.

### Support

- Join my [discord](https://discord.gg/tVA58nbBuk) and use the relative support channels.
- Open a ticket and please have your Tebex Transation ID ready 🙂.

### Changelog

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
