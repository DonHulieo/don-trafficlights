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
      - [Globals](#globals)
      - [Search](#search)
      - [Duration](#duration)
      - [Authorised Jobs](#authorised-jobs)
    - [Support](#support)
    - [Changelog](#changelog)

### Preview

- [don-trafficlights](https://www.youtube.com/watch?v=xx_WiEObrHk)
- [don-trafficlights v1.1](https://streamable.com/1a4gll)

### Installation

#### Dependencies

**Note:** This script is standalone, you do not need to install any dependencies if you do not want to.

- [QBCore](https://github.com/qbcore-framework/qb-core)
- [ESX](https://github.com/esx-framework/esx-legacy)

#### Initial Setup

- Always use the latest FiveM artifacts (tested on 6683), you can find them [here](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/).
- Download the latest version from your keymaster.
- Extract the contents of the zip file into your resources folder, into a folder which starts after your framework or;
- Ensure the script in your `server.cfg` after your framework.
- Configure both the globals `Config.JobCheck` and `Config.DebugMode` before starting the script, see [Configuration](#configuration) for more information.

**Note:** This script automatically configures it's Core functions to work with your framework.

### Configuration

#### Globals

```lua
Config.JobCheck = 'FirstResponder'
Config.DebugMode = false
```

- `JobCheck` string, can be either 'LEO', 'EMS' or 'FirstResponder' and sets what jobs trigger a light change.
- `DebugMode` boolean, set to true to enable debug mode.

#### Search

```lua
Config.Search = {
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
Config.Duration = {
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

#### Authorised Jobs

```lua
Config.AuthorisedJobs = {
    LEO = {
        Jobs = {['police'] = true, ['fib'] = true, ['sheriff'] = true},
        Types = {['police'] = true, ['leo'] = true},
        ...
    },
    EMS = {
        Jobs = {['ambulance'] = true, ['fire'] = true},
        Types = {['ambulance'] = true, ['fire'] = true, ['ems'] = true},
        ...
    },
}
```

- `Jobs` table, the jobs which should return true for the job check.
- `Types` table, the job types which should return true for the job check.

**Note:** The first two tables are editable (`LEO` and `EMS`), `FirstResponders` is not editable and is used for combined job checks.

### Support

- Join my [discord](https://discord.gg/tVA58nbBuk) and use the relative support channels.
- Open a ticket and please have your Tebex Transation ID ready 🙂.

### Changelog

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
