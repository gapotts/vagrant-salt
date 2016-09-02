common_packages:
  pkg.installed:
    - pkgs:
      - htop
      - strace
{% if grains['os_family'] == 'Debian' %}
      - vim
{% elif grains['os_family'] == 'RedHat' %}
      - vim-enhanced
{% endif %}
