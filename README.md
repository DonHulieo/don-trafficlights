# don-trafficlights

Traffic Lights Logic for QBCore! This is a paid script, available on my [Tebex](https://dons-developments.tebex.io/package/5370160).

## Optional Dependencies

- [qb-core](https://github.com/qbcore-framework/qb-core)
- [ESX](https://github.com/esx-framework/esx-legacy)

## Features

- Optimised code, resmon of 0~0.1ms. Peaking for civilians when stopped at lights and when LEO's have sirens on near traffic lights.
- Config Option for ESX or QBCore!
- Set the duration of traffic lights for players, lights will turn green after car has been stopped for the duration.
- Traffic Lights go green if player is an LEO and has sirens on.
- Local traffic now see's the updated signals, and will drive when the light turns green and halt when the light turns red.

## Preview

- [don-trafficlights](https://www.youtube.com/watch?v=xx_WiEObrHk)

## Important Config

```lua
Config.Framework = 'QBCore'
Config.JobCheck = 'FirstResponder'
Config.DebugMode = false
```

- `Framework` - Set to either 'QBCore', 'ESX' or 'None' depending on your server's framework.
- `JobCheck` - Set to the job type you want to check for, this is only used if you're using QBCore or ESX.
- `DebugMode` - Set to true if you want to see debug messages in the console and markers for the affected lights and vehicles.

```lua
Config.Search = {
    ['Lights'] = {
        enabled = true,
        distance = 80.0,
        headingThres = 45.0,
        max = 8
    },
    ...
}
```

- There are two search options, one for the traffic lights, `Lights` and one for the vehicles, `Vehicles`. Both have the same options.
- `enabled` - Set to true if you want to search for the respective entity.
- `distance` - The distance in meters to search for.
- `headingThres` - The heading threshold in degrees to search for.
- `max` - The maximum amount of entities to search for.

**Note:** The vehicle search feature is can be quite intensive depending on the amount of vehicles in the area, it is recommended to keep this disabled if you're not using it.

```lua
Config.Duration = {
    ['Civ'] = {
        checkTime = 1000,
        lightTime = 3500
    },
    ...
}
```

- There are two duration options, one for civilians, `Civ` and one for LEO's, `LEO`. Both have the same options.
- `checkTime` - The time in ms to check for traffic lights.
- `lightTime` - The time in ms until the light changes.

## LEO's

- Set your server's emergency service related job names (if they're different) in Config.AuthorizedJobs.

## Support

- Join my [discord](https://discord.gg/tVA58nbBuk) and use the relative support channels.
- Until a ticket system for support is created, please have your Tebex Transation ID ready 🙂.

## Changelog

- v1.1.1 - Localised functions, Changed the Config Further for More Options and Accessibility , Finalised Lua Documentation and Fixed Light Syncing Issue.
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
