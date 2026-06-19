# Local source overrides for the i.MX6ULL EVK board.
#
# Keep product-specific source-tree selections in the external tree instead of
# relying on an untracked local.mk in the Buildroot root directory.

UBOOT_OVERRIDE_SRCDIR = $(TOPDIR)/../u-boot-v2024.10
LINUX_OVERRIDE_SRCDIR = $(TOPDIR)/../linux-6.12
