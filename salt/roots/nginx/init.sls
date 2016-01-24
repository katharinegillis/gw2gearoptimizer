nginx_install_ppa:
  cmd.run:
    - name: "sudo add-apt-repository ppa:nginx/stable -y"

nginx_update_package_repositories:
  cmd.run:
    - name: "sudo apt-get update"
    - require:
      - cmd: nginx_install_ppa

nginx_install:
  pkg.installed:
    - name: nginx
    - require:
      - cmd: nginx_update_package_repositories
  service.running:
    - name: nginx
    - require:
      - pkg: nginx_install
    - watch:
      - file: nginx_config
      - file: nginx_site_config

nginx_config:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx/nginx.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: nginx_install

nginx_site_config:
  file.managed:
    - name: /etc/nginx/sites-available/default
    - source: salt://nginx/default
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: nginx_install