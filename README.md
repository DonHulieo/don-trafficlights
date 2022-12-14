# don-trafficlights
Traffic Lights Logic for QBCore! This is a paid script, available on my [Tebex](https://dons-developments.tebex.io/package/5370160).

# Optional Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [ESX](https://github.com/esx-framework/esx-legacy)

# Features
- Optimised code, resmon of 0~0.1ms. Peaking for civilians when stopped at lights and when LEO's have sirens on near traffic lights.
- Config Option for ESX or QBCore!
- Set the duration of traffic lights for players, lights will turn green after car has been stopped for the duration.
- Traffic Lights go green if player is an LEO and has sirens on.
- Local traffic now see's the updated signals, and will drive when the light tunes green.


# Preview
- [don-trafficlights](https://www.youtube.com/watch?v=xx_WiEObrHk)

# Important Config
```
Config.TrafficLights = {
    search = {
        step = 10.0, -- What distance each search should start at // A step of 10 with a minDist of 20 and maxDist of 60 will do 4 searches
        minDist = 20.0, -- How close the first traffic light search is
        maxDist = 60.0, -- How far away the last traffic light search is
        rad = 10.0, -- The radius of each search
        headingThres = 40.0 -- How different the heading of the players car can be from the traffic light
    },
    duration = {
        civCheckTime = 3000, -- How often it checks (in ms) if a civilian is stopped // Acts as a psuedo timer for reds
        leoCheckTime = 1000, -- How often to check if a LEO is in a vehicle and has sirens on
        lightTime = 5000, -- How long until the lights reset after changing
        leoLightTime = 7500 -- How long lights stay green for an LEO with sirens on
    }
}

Config.JobCheck = 'First Responder' -- Set to either LEO, EMS or FirstResponder to change what jobs trigger a light change
```
# LEO's
- Set your server's emergency service related job names (if they're different) in Config.AuthorizedJobs.

# Support
- Join my [discord](https://discord.gg/tVA58nbBuk) and use the relative support channels. 
- Until a ticket system for support is created, please have your Tebex Transation ID ready ????.

# Changelog
- v1.0.6 - Changed the Config option for ESX to be the same as QBCore, now you can add as many jobs as you want
- v1.0.5 - Added Sheriff and Highway as job titles for ESX
- v1.0.4 Added Config option for ESX, job check currently setup for police, ambulance and fire, use Config.JobCheck to set the job checks respectively.
- v1.0.3 Added amber light to smooth transitions when player leaving intersection area // server synced
- v1.0.2 Local traffic listens to the updated signals // server synced
- v1.0.1 Added Config.JobCheck so users aren???t forced to only use FirstResponders
