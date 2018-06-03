function provision_app
  ansible-playbook ~/src/github.com/ikdysfm/ansible-ubuntu/localhost_app.yml -i ~/src/github.com/ikdysfm/ansible-ubuntu/hosts --ask-become-pass
end
