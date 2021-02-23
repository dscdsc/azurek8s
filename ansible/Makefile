config:
	ansible-playbook -i hosts config-init.yml
install:
	ansible-playbook -i hosts install-init.yml
postconf:
	ansible-playbook -i hosts postconf-init.yml
k8sinit:
	ansible-playbook -i hosts k8s-init.yml
game:
	ansible-playbook -i hosts game-init.yml
reset:
	ansible-playbook -i hosts reset-init.yml
all:
	ansible-playbook -i hosts config-init.yml
	ansible-playbook -i hosts install-init.yml
	ansible-playbook -i hosts postconf-init.yml
	ansible-playbook -i hosts k8s-init.yml
	ansible-playbook -i hosts game-init.yml