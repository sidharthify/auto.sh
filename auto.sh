#!/usr/bin/env bash

DIST_DIR="/home/sidharthify/kernel/out/kernel_aarch64/dist"
KERNEL_BUILD_DIR="/home/sidharthify/kernel/"

cd "${KERNEL_BUILD_DIR}"

tools/bazel run //aosp:kernel_aarch64_dist

cd "${DIST_DIR}"
zip -r9 kernel.zip \
    vendor_kernel_boot.img \
    vendor_dlkm.img \
    system_dlkm.img \
    boot.img

echo "zipped images"

curl -s -o u.sh https://raw.githubusercontent.com/Sushrut1101/GoFile-Upload/master/upload.sh
chmod +x u.sh

bash u.sh kernel.zip

# clean up
rm -f u.sh kernel.zip
echo "cleaned up u.sh and kernel.zip"

