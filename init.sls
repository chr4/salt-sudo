# Install packages
sudo:
  pkg.installed: []
  file.managed:
    - name: /etc/sudoers
    - user: root
    - group: root
    - mode: 440
    - contents:
      - 'Defaults env_reset'
      - 'Defaults env_keep+=HOME'
      - 'Defaults env_keep+=SSH_CLIENT'
      - 'Defaults env_keep+=SSH_CONNECTION'
      - 'Defaults env_keep+=SSH_TTY'
      - 'Defaults env_keep+=SSH_AUTH_SOCK'
      - 'Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"'
      - ''
      - '# User privilege specification'
      - 'root ALL=(ALL) ALL'
      - ''
      - '# This is not a comment; see sudoers(5) for more information on "#include" directives'
      - '#includedir /etc/sudoers.d'
    - require:
      - pkg: sudo
