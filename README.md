# 🛠️ HWBoard Bike Computer PCB

[![KiBot CI/CD](https://github.com/axoulc/hwboard-bike-computer/workflows/KiBot%20CI%2FCD/badge.svg)](https://github.com/axoulc/hwboard-bike-computer/actions)
[![License: CERN-OHL-P](https://img.shields.io/badge/License-CERN--OHL--P--2.0-blue.svg)](https://github.com/axoulc/hwboard-bike-computer/blob/main/LICENSE)
[![KiCad](https://img.shields.io/badge/KiCad-9.0-blue.svg)](https://www.kicad.org/)

This project is a KiCad hardware design for a custom printed circuit board (PCB) that powers a modern open-source bike computer, inspired by [Pi Zero Bikecomputer](https://github.com/hishizuka/pizero_bikecomputer).

It enables you to build a feature-rich cycling computer with GPS, sensors, and offline maps, using an **STM32H743** microcontroller as the main processor and an **nRF54L** for Bluetooth Low Energy connectivity with a companion mobile app.

---

# 📦 Features
- Modular design for easy assembly and customization
- Powered by STM32H743 microcontroller for low-power, real-time performance
- nRF54L BLE module for smartphone connectivity
- Companion mobile app for ride sync and offline map transfer
- Supports GPS, ANT+ sensors, I2C sensors, and more
- Real-time display of maps, navigation, and sensor data
- Open-source software and hardware

---

## 🧠 CPU
- **Main Processor:** STMicroelectronics **STM32H743** (ARM Cortex-M7 @ 480 MHz)
- Real-time embedded firmware for low-power, responsive operation
- Rich peripheral set: TFT controller (LTDC), DMA2D, multiple UART/SPI/I2C

---

## 🖥️ Display
- 3.5 Inch TFT LCD Display with Resistive Touchscreen **ST7796U** or **ILI9488**
- Real-time data visualization: speed, cadence, power, altitude, maps
- Customizable data pages and layouts

---

## 📶 Connectivity
- **BLE Module:** Nordic Semiconductor **nRF54L** (Bluetooth 5.4 LE)
- Companion mobile app for ride data synchronization
- Offline map transfer from smartphone to bike computer
- Over-the-air (OTA) firmware updates

---

## 📡 GNSS (GPS)
- Module : STMicroelectronics **TESEO-LIV3R**
- UART GPS module with GPSd-compatible protocol
- Offline map support (OSM raster tiles, .mbtile, transferred via companion app)
- Course navigation, climb detection, cuesheet, overlays (heatmap/weather)

---

## 🧭 Sensors
- **ANT+ Sensors:** Heart rate, speed, cadence, power, light, environment
- **I2C Sensors:** Barometric altimeter, accelerometer, magnetometer, light sensor
- **Note:** ANT+ connectivity handled via dedicated receiver module

---

## 🔋 Power Supply
- Efficient power management for long rides

---

# Preview

## Schematics

[![schematic-preview](https://axoulc.github.io/hwboard-bike-computer/assets/schematics/hwboard-bike-computer-schematic.png)](https://axoulc.github.io/hwboard-bike-computer/assets/schematics/hwboard-bike-computer-schematic.pdf)
[Fullscreen PDF](https://axoulc.github.io/hwboard-bike-computer/assets/schematics/hwboard-bike-computer-schematic.pdf)

## PCB

### Top

![top-pcb-preview](https://axoulc.github.io/hwboard-bike-computer/assets/pcb/hwboard-bike-computer-top.png)

### Bottom

![bottom-pcb-preview](https://axoulc.github.io/hwboard-bike-computer/assets/pcb/hwboard-bike-computer-bottom.png)

## 3D

![top-3d-preview](https://axoulc.github.io/hwboard-bike-computer/assets/3d/hwboard-bike-computer-3d-top.png)

## 🏗️ Manufacturing & Documentation

This project uses automated CI/CD with KiBot to generate all necessary fabrication files:
- 📄 Schematics (PDF & PNG)
- 🔧 PCB documentation (PDF & PNG)
- 📦 Bill of Materials (HTML, XLSX, Interactive)
- 🏭 Gerber files, drill files, and position files
- 🎨 3D models and renders

See [KIBOT_CICD.md](KIBOT_CICD.md) for details on the automated build system.

---

## ⚙️ Printed Circuit Board 

**Manufacturing Sponsor:** Thanks to **PCBWay** for sponsoring fabrication and assembly of the hwboard-bike-computer. Their high-quality manufacturing, quick turnaround, significantly accelerated the build process. Moreover, their service was excellent and addressed questions promptly and clearly. As a bonus, PCBWay offers affordable, unique silkscreen colours.

More to come in the coming months for the first phase of production.

---

## 📚 Resources
- [STM32H743 Reference Manual](https://www.st.com/en/microcontrollers-microprocessors/stm32h743.html)
- [nRF54L Product Page](https://www.nordicsemi.com/Products/nRF54L)
- [Pi Zero Bikecomputer GitHub](https://github.com/hishizuka/pizero_bikecomputer)
- [KiBot CI/CD Documentation](KIBOT_CICD.md)

---

## 📝 License
This project is licensed under the CERN Open Hardware Licence Version 2 - Permissive.

For more details, see: https://ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2

---

## 🚴 Author
Inspired by [hishizuka](https://github.com/hishizuka/) and the Pi Zero Bikecomputer community.

---

Happy cycling and hacking!
