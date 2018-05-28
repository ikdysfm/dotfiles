function provision
  ansible-playbook ~/src/github.com/ikdysfm/ansible-ubuntu/localhost.yml -i ~/src/github.com/ikdysfm/ansible-ubuntu/hosts --ask-become-pass
end
