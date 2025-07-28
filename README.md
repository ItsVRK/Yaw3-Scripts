# YawVR-Scripts
Startup scripts that I use when I want to use the Yaw 3, will work with any YawVR simulator.

## Assumptions

These scripts assume that SteamVR and Virtual Desktop are installed to your C drive to the following directories, games must be SteamVR versions and can be installed to any drive:

- C:\Program Files (x86)\Steam\steamapps\common\SteamVR\
- C:\Program Files\Virtual Desktop Streamer\

## Usage

I have created shortcuts on my desktop for the following:

- Yaw 3 Startup > Yaw 3 Startup.bat
  - Sets OpenXR layer to SteamVR, launches Game Link and Infuse VR
- Elite Dangerous > Elite Startup Script.bat
  - Sets OpenXR layer to SteamVR, launches Voice Attack, EDCopilot, Game Link, Infuse VR, and Elite Dangerous
- X-Plane > X-Plane Startup Script.bat
  - Sets OpenXR layer to SteamVR, launches Game Link and Infuse VR, and XPlane 12
- Virtual Desktop > VD Streamer Startup.bat
  - Resets SteamVR's OpenXR layer to VDXR and then opens Virtual Desktop

## Run shortcuts as administrator

Because these scripts need to make registry edits to change the active OpenXR layer they need to also be run as administrator, to do this right click on the shortcut icon and select `Properties`, then from the `Shortcut` tab you can click the [Advanced...] button and check `Run as administrator`.

## Pretty Icons
There are icons in the repository for each of these, to set the icon on your Desktop shortcut right click on the icon and select `Properties`, then from the `Shortcut` tab you can click the [Change Icon...] button and browse to the icon.

## Support

- Patreon: https://www.patreon.com/ItsVRK
- Donate via Paypal: https://paypal.me/VRKforReal
