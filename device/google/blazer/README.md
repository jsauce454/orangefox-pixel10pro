**OrangeFox Recovery for Pixel 10 Pro (blazer)**

**Maintainer:** LeeGarChat

**Version:** R11.3 (based on RANCH 14.1)

**Status:** WORK IN PROGRESS — Ported from Pixel 8 Pro (husky) device tree

---

## ✅ Hardware Addresses VERIFIED (from actual Pixel 10 Pro device)

| Component | Address | Source |
|-----------|---------|--------|
| **UFS Controller** | `3c400000.ufs` | `/sys/devices/platform/3c400000.ufs` |
| **USB Controller** | `c400000.dwc3` | `/sys/devices/platform/simple_usb_bus/c450000.usb3/c400000.dwc3` |
| **Backlight** | `/sys/devices/platform/sswrp_dpu@ec00000/efd8000.dsi2host/efd8000.dsi2host.0/backlight/panel0-backlight` | sysfs dump |
| **Touch Module** | `syna_touch.ko` | `lsmod` output |

### Block Device Names (from /dev/block/by-name/)
- Standard A/B partition scheme with slots `_a` and `_b`
- `super` partition at `/dev/block/platform/3c400000.ufs/by-name/super`
- `userdata` at `/dev/block/platform/3c400000.ufs/by-name/userdata`

---

## ⚠️ CRITICAL: Items Still Requiring Verification

This tree was ported from the husky (Pixel 8 Pro / zuma / Tensor G3) tree. The Pixel 10 Pro uses the **deepspace** platform (Tensor G5) which is **TSMC-fabricated** (not Samsung Exynos like zuma).

Search for `TODO_VERIFY` across all files to find every item that needs attention.

### Hardware Updates Made
- ✅ UFS controller: Updated from `13200000.ufs` (zuma) to `3c400000.ufs` (deepspace)
- ✅ USB controller: Updated from `11210000.dwc3` (zuma) to `c400000.dwc3` (deepspace)
- ✅ fstab block paths: Updated to use `3c400000.ufs`

### Still TODO
- **Touch modules**: `syna_touch` identified but needs verification in recovery
- **Kernel and DTB**: Prebuilts must be extracted from actual blazer firmware
- **Screen resolution**: Verify TARGET_SCREEN_WIDTH/HEIGHT
- **Brightness values**: Verify TW_MAX_BRIGHTNESS matches actual hardware
- **Super partition size**: Verify OF_DYNAMIC_FULL_SIZE matches actual device

---

## What Works (Expected, inherited from husky)

* **MTP** (Media Transfer Protocol)
* **ADB Sideload**
* **ADB** (Android Debug Bridge)
* **Reflash Recovery** (custom code)
* **Flashing ROM**
* **Flashing ZIP files**
* **Slot Switcher** (BootControl)

---

## Known Issues (Expected)

### Major
1. **/data decryption**: Not supported (same as husky). Use DFE.
2. **USB Host / OTG**: Likely same DTB limitation as husky.
3. **Touch**: Will NOT work until correct touch kernel modules are identified and loaded.

### Minor
* **Flashlight**: May not work.
* **Vibration**: May not work.

---

## Build Information

* **OrangeFox Version:** R11.3
* **Base:** RANCH 14.1
* **Device:** Google Pixel 10 Pro (blazer)
* **Platform:** deepspace (Tensor G5)
* **Android:** 16 (API 36)
* **Maintainer:** LeeGarChat

---

## Device Family

This tree targets blazer (Pixel 10 Pro). Related codenames from the factory image:
- `blazer` — Pixel 10 Pro
- `mustang` — TBD
- `frankel` — TBD
- `rango` — TBD
- `deepspace` — SoC/platform name

---

*Ported from [twrp_device_google_husky](https://github.com/leegarchat/twrp_device_google_husky)*
