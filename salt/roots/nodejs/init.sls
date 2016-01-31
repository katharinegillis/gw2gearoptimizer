nodejs_download:
  cmd.run:
    - name: "wget https://nodejs.org/dist/v4.2.4/node-v4.2.4-linux-x64.tar.gz"

nodejs_install:
  cmd.run:
    - name: "sudo tar --strip-components 1 -xzvf node-v* -C /usr/local"
    - require:
      - cmd: nodejs_download

nodejs_npm_upgrade:
  cmd.run:
    - name: "npm install -g npm@latest"
    - require:
      - cmd: nodejs_install