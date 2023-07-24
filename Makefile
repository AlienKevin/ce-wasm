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

include $(shell cedev-config --makefile)
