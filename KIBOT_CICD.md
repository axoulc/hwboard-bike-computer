# KiBot CI/CD Configuration

This repository uses [KiBot](https://github.com/INTI-CMNB/KiBot) v1.8.4 to automatically generate fabrication and documentation files for the HWBoard Bike Computer PCB.

## 📋 What Gets Generated

The CI/CD pipeline automatically generates the following outputs in the `assets/` folder:

### 📄 Schematics
- **PDF**: Complete schematic in PDF format
- **PNG**: High-resolution schematic images (300 DPI)

### 🔧 PCB Documentation
- **PDF**: Multi-page PCB assembly documentation including:
  - Fabrication layers
  - Top layer with components
  - Bottom layer with components
- **PNG**: High-resolution renders (300 DPI):
  - Top view with components
  - Bottom view with components

### 📦 Bill of Materials (BOM)
- **HTML**: Interactive web-based BOM
- **XLSX**: Excel spreadsheet for ordering
- **iBOM**: Interactive HTML BOM for assembly

### 🏭 Manufacturing Files
- **Gerbers**: Complete set of Gerber files for PCB fabrication
- **Drill files**: Excellon drill files with PDF map
- **Position files**: CSV pick-and-place files for assembly

### 🎨 3D Models
- **STEP**: 3D model in STEP format
- **Renders**: Ray-traced 3D renders from top and bottom views

## 🚀 How It Works

### Automatic Triggers
The workflow runs automatically when:
- You push changes to `main` or `master` branch
- You create a pull request
- Changes are made to:
  - `*.kicad_sch` (schematic files)
  - `*.kicad_pcb` (PCB files)
  - `config.kibot.yaml` (KiBot configuration)
  - `.github/workflows/kibot.yml` (workflow file)

### Manual Trigger
You can also manually trigger the workflow:
1. Go to the **Actions** tab
2. Select **KiBot CI/CD** workflow
3. Click **Run workflow**

## 📥 Accessing Generated Files

After each workflow run:
1. Go to the **Actions** tab
2. Click on the latest workflow run
3. Download the artifacts:
   - `kibot-outputs`: Complete output directory
   - `fabrication-files`: Just the assets folder (retained for 90 days)

## 🛠️ Configuration

### KiBot Configuration
The main configuration is in `config.kibot.yaml`. It defines:
- Output formats and locations
- Layer configurations
- BOM column layout
- 3D render settings

### GitHub Actions Workflow
The workflow is defined in `.github/workflows/kibot.yml`. It uses:
- **KiBot version**: 1.8.4
- **KiCad version**: 8.x (via Docker image `v2_k8_1_8_4`)
- **ERC/DRC**: Skipped in CI (run locally before committing)

## 🔧 Local Testing

To test the configuration locally:

### Install KiBot
```bash
pip install kibot
```

### Run KiBot
```bash
# Generate all outputs
kibot -c config.kibot.yaml

# Generate specific output
kibot -c config.kibot.yaml schematic_pdf

# List available outputs
kibot -c config.kibot.yaml -l
```

## 📂 Output Structure

```
output/
└── assets/
    ├── schematics/
    │   ├── hwboard-bike-computer-schematic.pdf
    │   └── hwboard-bike-computer-schematic.png
    ├── pcb/
    │   ├── hwboard-bike-computer-pcb.pdf
    │   ├── hwboard-bike-computer-top.png
    │   └── hwboard-bike-computer-bottom.png
    ├── bom/
    │   ├── hwboard-bike-computer-bom.html
    │   ├── hwboard-bike-computer-bom.xlsx
    │   └── hwboard-bike-computer-ibom.html
    ├── gerbers/
    │   └── [Gerber files]
    ├── drill/
    │   └── [Drill files]
    ├── position/
    │   └── hwboard-bike-computer-position.csv
    └── 3d/
        ├── hwboard-bike-computer-3d.step
        ├── hwboard-bike-computer-3d-top.png
        └── hwboard-bike-computer-3d-bottom.png
```

## 🎯 Benefits

- ✅ **Consistency**: Same outputs every time
- ✅ **Automation**: No manual export needed
- ✅ **Version Control**: Track changes in generated files
- ✅ **Collaboration**: Easy sharing of fabrication files
- ✅ **Quality**: Automatic checks and validation
- ✅ **Documentation**: Always up-to-date documentation

## 📚 Resources

- [KiBot Documentation](https://kibot.readthedocs.io/)
- [KiBot GitHub](https://github.com/INTI-CMNB/KiBot)
- [KiBot Examples](https://github.com/INTI-CMNB/kibot_variants_arduprog)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

## 🐛 Troubleshooting

### Workflow Fails
1. Check the Actions tab for error messages
2. Verify file paths in `config.kibot.yaml`
3. Ensure schematic/PCB files are valid

### Missing Outputs
1. Check `config.kibot.yaml` output names
2. Verify layer configurations
3. Review KiBot logs in workflow output

### Local vs CI Differences
- CI uses Docker with specific KiCad version
- Some fonts or 3D models might differ
- ERC/DRC checks should be run locally first

## 📝 License

This CI/CD configuration is part of the HWBoard Bike Computer project and is licensed under the CERN Open Hardware Licence Version 2 - Permissive.

---

**Note**: First workflow run may take longer as Docker images are downloaded and cached.
