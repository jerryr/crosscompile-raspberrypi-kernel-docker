# Cross-Compile Raspberry Pi Kernel in a Docker Container
The Raspberry Pi [Documentation](https://www.raspberrypi.org/documentation/linux/kernel/building.md) does a very good job of explaining how to build a custom kernel for the Pi. This Dockerfile defines a Docker container that makes it relatively straightforward. Here is a snapshot of the steps, assuming you want to build a kernel for the RaspPi 4:

First clone the kernel source. 
```
git clone  --depth=1 --branch=rpi-5.10.y https://github.com/raspberrypi/linux # select the correct branch by running uname -r
```
Build the docker container in this repository
```
docker build -t raspi-cross-compile:latest .
```
Run the container, mounting the kernel source somewhere:
```
docker run -it --rm raspi-cross-compile:latest -v /path/to/kernel:/root/raspi-kernel -w /root/raspi-kernel
```
Now you can follow the steps in the Raspi documentation to build the kernel. For the Pi4, it would be:
```
KERNEL=kernel7l
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2711_defconfig
make -j4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage modules dtbs
```
Exit the container and copy the new kernel to the Pi