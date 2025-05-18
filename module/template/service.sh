#!/bin/sh

MODDIR=${0%/*}

MSP_TAG="[Magisk SElinux Permissive]"

echo "$MSP_TAG Waiting for boot to complete..." >> /dev/kmsg
BOOT_COMPLETED=$(getprop sys.boot_completed)
while [ "$BOOT_COMPLETED" != "1" ]; do
  sleep 1
  BOOT_COMPLETED=$(getprop sys.boot_completed)
done

echo "$MSP_TAG Boot completed!" >> /dev/kmsg

echo "$MSP_TAG Current enforcement -> $(getenforce)" >> /dev/kmsg

echo "$MSP_TAG Running 'setenforce permissive'" >> /dev/kmsg
setenforce permissive

echo "$MSP_TAG Current enforcement -> $(getenforce)" >> /dev/kmsg