function provision
  env ANSIBLE_CONFIG=/vagrant/provisioning/ansible.cfg ansible-playbook /vagrant/provisioning/playbook.yml -i /vagrant/provisioning/hosts
end
