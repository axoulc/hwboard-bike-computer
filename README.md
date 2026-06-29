# HWBoard Bike Computer PCB

[![KiBot CI/CD](https://github.com/axoulc/hwboard-bike-computer/workflows/KiBot%20CI%2FCD/badge.svg)](https://github.com/axoulc/hwboard-bike-computer/actions)
[![License: CERN-OHL-P](https://img.shields.io/badge/License-CERN--OHL--P--2.0-blue.svg)](https://github.com/axoulc/hwboard-bike-computer/blob/main/LICENSE)
[![KiCad](https://img.shields.io/badge/KiCad-9.0-blue.svg)](https://www.kicad.org/)

This repository contains the KiCad hardware design for an open-source bike computer PCB. The target design is a solderable, small-series-friendly board with a sunlight-readable display, dual-frequency GNSS, BLE/ANT+ radio support, local storage, outdoor sensors, and USB-C rechargeable Li-ion power.

The hardware direction is based on a Rust `no_std` firmware target using `embassy-stm32`.

## Hardware Architecture

```text
USB-C 5 V
   |
   +-- ESD protection / CC resistors
   |
BQ25622E Li-ion charger with power path
   |
   +-- 1S Li-ion battery + NTC
   +-- SYS rail
   +-- I2C to STM32
        |
        +-- 3V3 system rail
        +-- low-noise GNSS rail
        +-- filtered radio rail
        +-- sensor rail
        +-- display backlight driver

STM32H563VIT6
   +-- SPI TFT display
   +-- I2C touch / sensors / power management
   +-- u-blox NEO-F10N GNSS over UART
   +-- nRF52840 module over SPI
   +-- microSD over SDMMC 4-bit
   +-- USB FS optional
   +-- SWD debug
```

## Main Components

| Function | Selected or target part | Notes |
|---|---|---|
| MCU | `STM32H563VIT6` | Cortex-M33, 250 MHz, 2 MB flash, 640 KB RAM, LQFP100 |
| GNSS | `u-blox NEO-F10N` | Dual-frequency L1/L5 GNSS with external active antenna |
| Radio | Raytac `MDBT50Q-U1MV2` module | nRF52840 module candidate with U.FL connector for an external antenna |
| Charger / power path | `BQ25622E` / `BQ25622ERYKR` | 1S Li-ion, USB-C input, I2C control |
| Fuel gauge | `MAX17048G+` | ModelGauge battery SoC monitor over I2C |
| Boost converter | `TPS61089` | High-current boost converter for auxiliary rails |
| IMU | `LSM6DSVTR` | 6-axis accelerometer + gyroscope |
| Magnetometer | `LIS2MDLTR` | Keep away from inductors, speaker/haptic parts, battery current, USB-C, and steel hardware |
| Barometer | `LPS22DFTR` preferred, `LPS22HBTR` acceptable | New design should prefer LPS22DF; include a vent and hydrophobic membrane |
| Storage | microSD | SDMMC 4-bit interface |
| Display | 2.8-3.0 inch 240x400 SPI TFT target | Final outdoor transflective panel still to be confirmed |

## Design Priorities

- No BGA packages for the main board.
- External antennas through U.FL / I-PEX MHF connectors.
- Keep GNSS, radio, magnetometer, switching converters, and backlight physically separated.
- Use a compact, well-controlled power layout around charger and boost switch nodes.
- Keep the display SPI bandwidth realistic by using partial redraws and DMA.
- Include physical buttons because touch can be unreliable with rain, gloves, or vibration.

## Documentation

Local component datasheets are kept in [docs/datasheets](docs/datasheets). The index in [docs/README.md](docs/README.md) records each local PDF and the official source URL.

Current local datasheets include:

- `STM32H563VI`
- `NEO-F10N`
- `MDBT50Q-U1MV2`
- `BQ25622E`
- `TPS61089`
- `LIS2MDL`
- `LSM6DSV`
- `LPS22DF`

The `MAX17048/MAX17049` datasheet is linked from the docs index through Analog Devices because the official PDF endpoint did not complete an unattended download in this environment.

## Preview

### Schematics

[![schematic-preview](https://axoulc.github.io/hwboard-bike-computer/assets/schematics/hwboard-bike-computer-schematic.png)](https://axoulc.github.io/hwboard-bike-computer/assets/schematics/hwboard-bike-computer-schematic.pdf)
[Fullscreen PDF](https://axoulc.github.io/hwboard-bike-computer/assets/schematics/hwboard-bike-computer-schematic.pdf)

### PCB

#### Top

![top-pcb-preview](https://axoulc.github.io/hwboard-bike-computer/assets/pcb/hwboard-bike-computer-top.png)

#### Bottom

![bottom-pcb-preview](https://axoulc.github.io/hwboard-bike-computer/assets/pcb/hwboard-bike-computer-bottom.png)

### 3D

![top-3d-preview](https://axoulc.github.io/hwboard-bike-computer/assets/3d/hwboard-bike-computer-3d-top.png)

## Manufacturing

This project uses KiBot automation to generate manufacturing files:

- Schematics in PDF and PNG
- PCB documentation in PDF and PNG
- Bill of materials in HTML, XLSX, and interactive formats
- Gerbers, drill files, and position files
- 3D models and renders

See [KIBOT_CICD.md](KIBOT_CICD.md) for details.

## Sponsor

Thanks to PCBWay for sponsoring fabrication and assembly of the hwboard-bike-computer prototype.

## License

This project is licensed under the CERN Open Hardware Licence Version 2 - Permissive.

For more details, see <https://ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2>.
