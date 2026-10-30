#!/bin/sh
# Docker olmadan derleme (Linux). arm-none-eabi-gcc PATH'te olmali; bu surum GCC 15.2.1 (xPack) ile derlendi.
# Kullanim: tools/build-local.sh <firmware klasoru> <cikti klasoru> [TARGET]
# Ornek:    tools/build-local.sh firmware builds bmks.survival.tr
set -e
FW="$1"; OUT="$(cd "$(dirname "$2")" && pwd)/$(basename "$2")"; TARGET="${3:-bmks.survival}"; V=v6.9
mkdir -p "$OUT"; cd "$FW"
find . -name '*.d' -delete; find . -name '*.o' -delete
make -s -j8 ENABLE_SURVIVAL=1 ENABLE_SPECTRUM=0 ENABLE_FMRADIO=1 ENABLE_VOX=0 ENABLE_AIRCOPY=0 \
  ENABLE_FEAT_F4HWN_SCREENSHOT=1 ENABLE_FEAT_F4HWN_GAME=0 ENABLE_FEAT_F4HWN_PMR=1 \
  ENABLE_FEAT_F4HWN_GMRS_FRS_MURS=1 ENABLE_NOAA=0 ENABLE_FEAT_F4HWN_RESCUE_OPS=0 \
  BMK_SIGNATURE= EDITION_STRING=Survival \
  ENABLE_AUDIO_BAR=0 ENABLE_FEAT_F4HWN_RESUME_STATE=0 ENABLE_FEAT_F4HWN_SLEEP=0 \
  ENABLE_FEAT_F4HWN_RX_TX_TIMER=0 ENABLE_FEAT_F4HWN_CA=0 ENABLE_NO_CODE_SCAN_TIMEOUT=0 \
  AUTHOR_STRING_1=BMKs AUTHOR_STRING_2=BMKs AUTHOR_STRING=BMKs \
  VERSION_STRING_2=$V SURVIVAL_VERSION=$V TARGET=$TARGET
arm-none-eabi-size $TARGET
cp $TARGET.bin $TARGET.packed.bin "$OUT/"
rm -f $TARGET $TARGET.bin $TARGET.packed.bin
S=$(stat -c %s "$OUT/$TARGET.bin"); echo "bin: $S bayt, bos: $((61440 - S)) / 61440"
