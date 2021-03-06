# Install packages
sudo:
  pkg.installed: []
  file.managed:
    - name: /etc/sudoers
    - user: root
    - group: root
    - mode: 440
    - source: salt://{{ tpldir }}/sudoers
    - require:
      - pkg: sudo
