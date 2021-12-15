# -*- mode: ruby -*-
# vi: set ft=ruby :

# Variables
IMAGE_OS_NAME = "flatcar-alpha"

SRCDIR = "sync"
DSTDIR = "/var/tmp/sync"

lab = {
  "tetrate"      => { :osimage => IMAGE_OS_NAME,  :mac => "080027112232", :ip => "192.168.0.11",  :cpus => 2,  :mem =>4096,  :custom_host => "fcc.sh"  }
  }

Vagrant.configure("2") do |config|
  lab.each_with_index do |(hostname, info), index|
    config.vm.define hostname do |cfg|

      # Synchronization apps/ dir into destination /vagrant dir (needed for deploy application into K8s cluster)
      config.vm.synced_folder '.', '/vagrant',
      type: 'rsync',
      # rsync__verbose: true,
      rsync__exclude: [
        'extrastorage', 'src', '.gitignore',
        'README.md', 'Vagrantfile', '.vagrant', 
        '.git','*.txt'
      ]

      # Define motd
      cfg.vm.provision "shell", path: "src/scripts/provisioning/#{info[:custom_host]}", privileged: true

      # Additional Software (Helm, Kind, etc)
      cfg.vm.provision "shell", path: "src/scripts/provisioning/addons.sh", privileged: true

      # Spinup k3d
      cfg.vm.provision "shell", path: "src/scripts/provisioning/k3d-setup.sh", privileged: true

      # Tools aliases
      cfg.vm.provision "shell", path: "src/scripts/provisioning/aliases.sh", privileged: true

      # start first run privider
      cfg.vm.provider :virtualbox do |vb, override|

        # Memory, CPU, Image configuration
        vb.memory = "#{info[:mem]}"
        vb.cpus = "#{info[:cpus]}"
        config.vm.box = info[:osimage]

        override.vm.network "public_network", :adapter=>1 , type: "dhcp", :bridge => "Intel(R) Wi-Fi 6 AX200 160MHz", :mac => "#{info[:mac]}"
        config.ssh.host = "#{info[:ip]}"


        # SSH filesystem mounts
        #override.vm.synced_folder SRCDIR, DSTDIR, type: 'sshfs', ssh_opts_append: "-o Compression=yes", sshfs_opts_append: "-o cache=no", disabled: false, create: true

        # Configure hostname
        override.vm.hostname = hostname

      end # end provider
    end # end config
  end # end lab
end
