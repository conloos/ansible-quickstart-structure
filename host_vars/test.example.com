---
# ansible_python_interpreter: /usr/bin/python3
ansible_host: test.example.com
# ansible_netmask: mask
# ansible_gateway: ip
# ansible_nameserver: ip
# ansible_connection: ssh|local
# ansible_user: root
# ansible_become_pass: "{{ user_admin.pass }}"
# ansible_port: 2222

additional_container_config_values:
  security.nesting: 'false'
  security.privileged: 'false'
  volatile.eth0.hwaddr: '00:16:3f:df:ca:fe'
cloudinit_network_raw:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: False
      addresses: [192.168.178.99/24]
      gateway4: 192.168.178.1
      nameservers:
        addresses: [192.168.178.13]
...
