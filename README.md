**This repository is to host sample vagrantfiles for different OS'es and the sample bootstrape files as well.**

**When you get errors like this -**

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

**Solution on CentOS ->**

```yum install kernel-headers kernel-devel```
```yum install -y gcc perl kernel-headers kernel-devel```
```/sbin/rcvboxadd setup```



**To copy files from host to vagrant vm add this line to your Vagrantfile --**

```config.vm.provision :file, source: "./hosts_to_copy", destination: "/tmp/"```

**To run bootsrap file add this line to your Vagrantfile --**

```config.vm.provision :shell, path: "bootstrap.sh"```


**To reload the Vagrant vm configuration after making changes to bootstrap file or file run this command -->**

```Vagrant reload --provision-with file,shell```

https://www.vagrantup.com/docs/cli/reload

https://phoenixnap.com/kb/vagrant-beginner-tutorial

**To add secondary disk to a Vagrant box add this to Vagrantfile->**

```
node.vm.provider :virtualbox do |v|
         unless File.exist?(disk)
            v.customize ['createhd', '--filename', disk, '--variant', 'Fixed', '--size', 20 * 1024]
         end
         v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk]

      end
```      

Ref - https://everythingshouldbevirtual.com/virtualization/vagrant-adding-a-second-hard-drive

