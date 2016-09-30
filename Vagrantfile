Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "bento/ubuntu-14.04"

	config.vm.network "private_network", ip: "192.168.33.10"
	config.vm.hostname = "localdev.gw2gearopt.tichi.org"

	config.vm.synced_folder "app/", "/home/vagrant/gitrepo/app", create: true, nfs: true

	if not Vagrant::Util::Platform.windows?
		config.vm.provision "ansible" do |ansible|
			ansible.playbook = "ansible/install.yml"
			ansible.inventory_path = "ansible/inventories/vagrant"
			ansible.limit = "all"
		end
	end
end