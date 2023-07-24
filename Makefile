# ----------------------------
# Makefile Options
# ----------------------------

NAME = TEST
ICON = icon.png
DESCRIPTION = "Test Demo"
COMPRESSED = YES
ARCHIVED = YES
LTO = NO

CFLAGS = -Wall -Wextra -O3 -fno-optimize-sibling-calls -frounding-math
CXXFLAGS = -Wall -Wextra -O3

# ----------------------------

# Compile WAT source to C
SRC_WAT=src/add.wat
TARGET_C=src/add.c
TARGET_WASM=add.wasm

# Rule to convert .wat to .c when .wat changes
$(TARGET_C): $(TARGET_WASM)
	wasm2c $< -o $@
	rm $(TARGET_WASM)

# Rule to convert .wat to .wasm when .wat changes
$(TARGET_WASM): $(SRC_WAT)
	wat2wasm $< -o $@

include $(shell cedev-config --makefile)
