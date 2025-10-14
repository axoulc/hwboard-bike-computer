# Makefile for HWBoard Bike Computer KiBot automation
# Requires KiBot installed: pip install kibot

# Configuration
KIBOT_CONFIG = hwboard.kibot.yaml
KIBOT = kibot
OUTPUT_DIR = output

# Project files
SCHEMATIC = hwboard-bike-computer.kicad_sch
PCB = hwboard-bike-computer.kicad_pcb

# Colors for terminal output
COLOR_RESET = \033[0m
COLOR_INFO = \033[0;36m
COLOR_SUCCESS = \033[0;32m
COLOR_ERROR = \033[0;31m

.PHONY: all clean help list schematics pcb bom gerbers 3d install check

# Default target
all: check schematics pcb bom gerbers 3d
	@echo "$(COLOR_SUCCESS)✓ All outputs generated successfully!$(COLOR_RESET)"

help:
	@echo "$(COLOR_INFO)HWBoard Bike Computer - KiBot Automation$(COLOR_RESET)"
	@echo ""
	@echo "Available targets:"
	@echo "  all         - Generate all outputs (default)"
	@echo "  schematics  - Generate schematic PDF and PNG"
	@echo "  pcb         - Generate PCB documentation and renders"
	@echo "  bom         - Generate Bill of Materials"
	@echo "  gerbers     - Generate Gerber and drill files"
	@echo "  3d          - Generate 3D models and renders"
	@echo "  list        - List all available outputs"
	@echo "  check       - Verify KiBot installation"
	@echo "  clean       - Remove generated files"
	@echo "  install     - Install KiBot"

# Check if KiBot is installed
check:
	@echo "$(COLOR_INFO)Checking KiBot installation...$(COLOR_RESET)"
	@command -v $(KIBOT) >/dev/null 2>&1 || \
		(echo "$(COLOR_ERROR)✗ KiBot not found. Run 'make install' first.$(COLOR_RESET)" && exit 1)
	@echo "$(COLOR_SUCCESS)✓ KiBot is installed$(COLOR_RESET)"
	@$(KIBOT) --version

# Install KiBot
install:
	@echo "$(COLOR_INFO)Installing KiBot...$(COLOR_RESET)"
	pip install kibot
	@echo "$(COLOR_SUCCESS)✓ KiBot installed successfully$(COLOR_RESET)"

# List all available outputs
list:
	@$(KIBOT) -c $(KIBOT_CONFIG) -l

# Generate schematics
schematics: check
	@echo "$(COLOR_INFO)Generating schematics...$(COLOR_RESET)"
	@$(KIBOT) -c $(KIBOT_CONFIG) -d $(OUTPUT_DIR) schematic_pdf schematic_png
	@echo "$(COLOR_SUCCESS)✓ Schematics generated$(COLOR_RESET)"

# Generate PCB documentation
pcb: check
	@echo "$(COLOR_INFO)Generating PCB documentation...$(COLOR_RESET)"
	@$(KIBOT) -c $(KIBOT_CONFIG) -d $(OUTPUT_DIR) pcb_pdf pcb_top_png pcb_bottom_png
	@echo "$(COLOR_SUCCESS)✓ PCB documentation generated$(COLOR_RESET)"

# Generate Bill of Materials
bom: check
	@echo "$(COLOR_INFO)Generating Bill of Materials...$(COLOR_RESET)"
	@$(KIBOT) -c $(KIBOT_CONFIG) -d $(OUTPUT_DIR) bom_html bom_xlsx ibom
	@echo "$(COLOR_SUCCESS)✓ BOM generated$(COLOR_RESET)"

# Generate Gerber files
gerbers: check
	@echo "$(COLOR_INFO)Generating Gerber files...$(COLOR_RESET)"
	@$(KIBOT) -c $(KIBOT_CONFIG) -d $(OUTPUT_DIR) gerbers drill position
	@echo "$(COLOR_SUCCESS)✓ Gerber files generated$(COLOR_RESET)"

# Generate 3D models
3d: check
	@echo "$(COLOR_INFO)Generating 3D models...$(COLOR_RESET)"
	@$(KIBOT) -c $(KIBOT_CONFIG) -d $(OUTPUT_DIR) step_3d 3d_top_view 3d_bottom_view
	@echo "$(COLOR_SUCCESS)✓ 3D models generated$(COLOR_RESET)"

# Clean generated files
clean:
	@echo "$(COLOR_INFO)Cleaning generated files...$(COLOR_RESET)"
	@rm -rf $(OUTPUT_DIR)
	@echo "$(COLOR_SUCCESS)✓ Clean complete$(COLOR_RESET)"

# Quick target - just essentials
quick: check schematics pcb
	@echo "$(COLOR_SUCCESS)✓ Quick outputs generated$(COLOR_RESET)"
