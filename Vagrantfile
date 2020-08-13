disk = './secondDisk.vdi'
Vagrant.configure("2") do |config|
  servers=[
    {
      :hostname => "centos7-kernel-test",
      :box => "bento/centos-7.8",
      :ip => "192.168.56.220",
      :ssh_port => '2250',
          :ram => 2048,
          :cpu => 2
    }

  ]

  servers.each do |machine|

    config.vm.provision :file, source: "./hosts_to_copy", destination: "/tmp/"
    config.vm.provision :shell, path: "bootstrap.sh"
    config.vm.define machine[:hostname] do |node|
      node.vm.box = machine[:box]
      node.vm.hostname = machine[:hostname]

      node.vm.network :private_network, ip: machine[:ip]
      node.vm.network "forwarded_port", guest: 22, host: machine[:ssh_port], id: "ssh"

      node.vm.provider :virtualbox do |v|
         unless File.exist?(disk)
	    v.customize ['createhd', '--filename', disk, '--variant', 'Fixed', '--size', 20 * 1024]
	 end   
         v.customize ["modifyvm", :id, "--memory", machine[:ram]]
                 v.customize ["modifyvm", :id, "--cpus", machine[:cpu]]
         v.customize ["modifyvm", :id, "--name", machine[:hostname]]
	 v.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk]

      end
    end
  end
end

