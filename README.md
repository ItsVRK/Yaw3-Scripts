# YawVR-Scripts
Startup scripts that I use when I want to use the Yaw 3, will work with any YawVR simulator.

## Assumptions

These scripts assume that SteamVR and Virtual Desktop are installed to your C drive to the following directories, games must be SteamVR versions and can be installed to any drive:

- C:\Program Files (x86)\Steam\steamapps\common\SteamVR\
- C:\Program Files\Virtual Desktop Streamer\

## Usage

I have created shortcuts on my desktop for the following (right click and drag the script to the desktop and select create shortcut when you let go of mouse button):

- Yaw 3 Startup > Yaw 3 Startup.bat
  - Sets SteamVR's OpenXR layer to SteamVR
  - Launch Game Link
  - Launch Infuse VR
- Elite Dangerous > Elite Startup Script.bat
  - Sets SteamVR's OpenXR layer to SteamVR
  - Launch Voice Attack
  - Launch EDCopilot
  - Launch Game Link
  - Launch Infuse VR
  - Launch Elite Dangerous
- X-Plane > X-Plane Startup Script.bat
  - Sets SteamVR's OpenXR layer to SteamVR
  - Launch Game Link
  - Launch Infuse VR
  - Launch X-Plane12
- Virtual Desktop > VD Streamer Startup.bat
  - Sets SteamVR's OpenXR layer to VDXR
  - Launches Virtual Desktop

## Run shortcuts as administrator

Because these scripts need to make registry edits to change the active OpenXR layer they need to also be run as administrator, to do this right click on the shortcut icon and select `Properties`, then from the `Shortcut` tab you can click the [Advanced...] button and check `Run as administrator`.

## Pretty Icons
There are icons in the repository for each of these, to set the icon on your Desktop shortcut right click on the icon and select `Properties`, then from the `Shortcut` tab you can click the [Change Icon...] button and browse to the icon.

## Support

- Patreon: https://www.patreon.com/ItsVRK
- Donate via Paypal: https://paypal.me/VRKforReal
