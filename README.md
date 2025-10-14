# 🛠️ HWBoard Bike Computer PCB

This project is a KiCad hardware design for a custom printed circuit board (PCB) that powers a modern open-source bike computer, inspired by [Pi Zero Bikecomputer](https://github.com/hishizuka/pizero_bikecomputer).

It enables you to build a feature-rich cycling computer with GPS, sensors, and offline maps, using a Raspberry Pi Compute Module 0 (CM0) as the main processor.

---

## 📦 Features
- Modular design for easy assembly and customization
- Compatible with Raspberry Pi CM0 ecosystem
- Supports GPS, ANT+ sensors, I2C sensors, and more
- Real-time display of maps, navigation, and sensor data
- Open-source software and hardware

---

## 🧠 CPU
- **Main Processor:** Raspberry Pi Compute Module 0 (CM0)
- Runs Linux (Raspberry Pi OS Trixie recommended)
- Supports Python, PyQt6, GPSd, and CircuitPython libraries

---

## 🖥️ Display
- MIP Reflective color LCD or other compatible displays
- Real-time data visualization: speed, cadence, power, altitude, maps
- Customizable data pages and layouts

---

## 📡 GNSS (GPS)
- UART GPS module (via GPSd) and I2C GPS supported
- Positioning via GPS or Android app (GadgetBridge)
- Offline map support (OSM raster tiles, .mbtile)
- Course navigation, climb detection, cuesheet, overlays (heatmap/weather)

---

## 🧭 Sensors
- **ANT+ Sensors:** Heart rate, speed, cadence, power, light, environment
- **I2C Sensors:** Barometric altimeter, accelerometer, magnetometer, light sensor
- **Note:** ANT+ sensors require USB dongle

---

## 🔋 Power Supply
- Designed for mobile battery packs (e.g., 3100mAh for ~18h runtime)
- Efficient power management for long rides

---

## 📚 Resources
- [Pi Zero Bikecomputer GitHub](https://github.com/hishizuka/pizero_bikecomputer)
- [Hardware Installation Guide](https://github.com/hishizuka/pizero_bikecomputer/blob/master/doc/hardware_installation.md)
- [Software Installation Guide](https://github.com/hishizuka/pizero_bikecomputer/blob/master/doc/software_installation.md)

---

## 📝 License
This project is licensed under the CERN Open Hardware Licence Version 2 - Permissive.

For more details, see: https://ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2

---

## 🚴 Author
Inspired by [hishizuka](https://github.com/hishizuka/) and the Pi Zero Bikecomputer community.

---

Happy cycling and hacking!
