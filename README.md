# Buildroot External Tree

This repository contains the Buildroot external tree used by the BSP workspace.
It is intended to host board-specific Buildroot integration for multiple boards,
including the i.MX6ULL ATK-DL6Y2C board.

Each board should keep its Buildroot defconfig, board files, post-image scripts,
root filesystem overlays, and package overrides under a board-specific directory.
Existing i.MX6ULL support is one board configuration in this external tree.

## Current Board Support

- `configs/imx6ull_defconfig` for the i.MX6ULL default profile
- `configs/imx6ull_debug_defconfig` for the i.MX6ULL debug profile
- `configs/imx6ull_sdk_defconfig` for the i.MX6ULL SDK profile
- `board/freescale/imx6ull/` for i.MX6ULL board files
- `package/lpf/` for LPF integration

## Build

From the BSP workspace root, run Buildroot with this external tree:

```sh
cd buildroot
make BR2_EXTERNAL=../br2-external imx6ull_defconfig
make
```

The i.MX6ULL defconfigs keep the BSP board-specific paths and source overrides
in this external tree.

The current board configuration uses local source overrides from the BSP
workspace:

- `../linux/linux-7.0`
- `../uboot/uboot-2024.10`
- `../lpf`

## Adding Board Support

When adding another board, keep the layout predictable:

- Add the board defconfig under `configs/`.
- Add board files under `board/<vendor>/<board>/`.
- Keep root filesystem overlays, kernel config fragments, post-image scripts,
  and image layout files inside the board directory.
- Add board-specific package overrides through `local.mk` or another clearly
  named board-local makefile.
- Document board-specific build and boot steps in the board directory.

Use the i.MX6ULL files as a reference for the current structure, but avoid
hard-coding new board support to i.MX6ULL-specific paths or names unless the
configuration is genuinely i.MX6ULL-specific.
