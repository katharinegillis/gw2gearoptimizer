#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
mongodb_install_gpg_key:
  cmd.run:
    - name: "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927"

#echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
mongodb_create_list_file:
  cmd.run:
    - name: "echo \"deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse\" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list"
    - require:
      - cmd: mongodb_install_gpg_key

#sudo apt-get update
mongodb_update_package_database:
  cmd.run:
    - name: "sudo apt-get update"
    - require:
      - cmd: mongodb_create_list_file

#sudo apt-get install -y mongodb-org
#sudo apt-get install -y python3-pip
mongodb_install:
  pkg.installed:
    - pkgs:
      - mongodb-org
  service.running:
    - name: mongod
    - require:
      - pkg: mongodb_install