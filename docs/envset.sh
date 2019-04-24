#!/bin/bash
set -x
API=21
NDK=/media/hsujee/share/code/ff/android-ndk-r17c
SYSROOT=$NDK/platforms/android-$API/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
CPU=armv7-a
PREFIX=$(pwd)/android/$CPU
function function_one
{
  ./configure \
      --prefix=$PREFIX \
	--enable-shared \
	--disable-static \
	--disable-doc \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-symver \
	--disable-ffmpeg \
	--cc=$TOOLCHAIN/bin/arm-linux-androideabi-gcc \
	--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
	--target-os=android \
	--arch=arm \
	--enable-cross-compile \
	--sysroot=$SYSROOT \
	--extra-cflags="-I$NDK/sysroot/usr/include/arm-linux-androideabi -isysroot $NDK/sysroot -fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a" \
	--enable-small \
	--enable-neon \
	--enable-jni \
	--enable-mediacodec \
	--enable-decoder=h264_mediacodec \
	--enable-hwaccel=h264_mediacodec \
	--disable-debug \
	--disable-doc \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffprobe 
	
#make clean all
	make 
	make install
}
function_one
