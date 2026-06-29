# Documentation

This folder keeps project documentation and component datasheets for the current target hardware architecture.

## Datasheets

| Function | Part | Local PDF | Official source |
|---|---|---|---|
| MCU | STM32H563VI / STM32H563VIT6 | [datasheets/stm32h563vi.pdf](datasheets/stm32h563vi.pdf) | <https://www.st.com/resource/en/datasheet/stm32h563vi.pdf> |
| GNSS | u-blox NEO-F10N | [datasheets/neo-f10n.pdf](datasheets/neo-f10n.pdf) | <https://content.u-blox.com/sites/default/files/documents/NEO-F10N_DataSheet_UBX-23002117.pdf> |
| BLE / ANT+ radio module candidate | Raytac MDBT50Q-U1MV2 | [datasheets/raytac-mdbt50q-u1mv2.pdf](datasheets/raytac-mdbt50q-u1mv2.pdf) | <https://www.raytac.com/download/index.php?index_id=44> |
| Battery charger / power path | BQ25622E / BQ25622ERYKR | [datasheets/bq25622e.pdf](datasheets/bq25622e.pdf) | <https://www.ti.com/lit/ds/symlink/bq25622e.pdf> |
| Fuel gauge | MAX17048G+ | Official link only | <https://www.analog.com/media/en/technical-documentation/data-sheets/MAX17048-MAX17049.pdf> |
| Boost converter | TPS61089 | [datasheets/tps61089.pdf](datasheets/tps61089.pdf) | <https://www.ti.com/lit/ds/symlink/tps61089.pdf> |
| Magnetometer | LIS2MDL / LIS2MDLTR | [datasheets/lis2mdl.pdf](datasheets/lis2mdl.pdf) | <https://www.st.com/resource/en/datasheet/lis2mdl.pdf> |
| IMU | LSM6DSV / LSM6DSVTR | [datasheets/lsm6dsv.pdf](datasheets/lsm6dsv.pdf) | <https://www.st.com/resource/en/datasheet/lsm6dsv.pdf> |
| Barometer, preferred for new PCB | LPS22DF / LPS22DFTR | [datasheets/lps22df.pdf](datasheets/lps22df.pdf) | <https://www.st.com/resource/en/datasheet/lps22df.pdf> |

## Cleanup Notes

Removed obsolete local documentation for the previous Raspberry Pi Compute Module 0 / CM0IO reference-board direction and stale TESEO-LIV3R files. The current docs now track the STM32H563 + NEO-F10N + nRF52840-module architecture.

The Analog Devices MAX17048/MAX17049 PDF endpoint either returned 403 or timed out during unattended download attempts, so the docs index keeps the official source URL without committing an empty or non-validated PDF.
