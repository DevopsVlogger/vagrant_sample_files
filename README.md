*When you get errors like this -*

VirtualBox Guest Additions: Starting.
VirtualBox Guest Additions: Building the VirtualBox Guest Additions kernel
modules.  This may take a while.
VirtualBox Guest Additions: To build modules for other installed kernels, run
VirtualBox Guest Additions:   /sbin/rcvboxadd quicksetup <version>
VirtualBox Guest Additions: or
VirtualBox Guest Additions:   /sbin/rcvboxadd quicksetup all
VirtualBox Guest Additions: Kernel headers not found for target kernel
3.10.0-1127.18.2.el7.x86_64. Please install them and execute
  /sbin/rcvboxadd setup


Stderr from the command:

modprobe vboxguest failed
The log file /var/log/vboxadd-setup.log may contain further information.

Solution on CentOS ->
yum install kernel-headers kernel-devel
yum install -y gcc perl kernel-headers kernel-devel
/sbin/rcvboxadd setup
