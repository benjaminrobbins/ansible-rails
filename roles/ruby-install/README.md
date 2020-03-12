# Ansible Role: Install ruby-install
* Development branch: [![Build Status](https://travis-ci.org/ferrarimarco/ansible-role-ruby-install.svg?branch=development)](https://travis-ci.org/ferrarimarco/ansible-role-ruby-install)
* Master branch: [![Build Status](https://travis-ci.org/ferrarimarco/ansible-role-ruby-install.svg?branch=master)](https://travis-ci.org/ferrarimarco/ansible-role-ruby-install)

An Ansible role that installs ruby-install.

## Using the role
### Installation
```
ansible-galaxy install ferrarimarco.ruby-install
```

### Variables
See [defaults/main.yml](defaults/main.yml)

### Example Playbook
```
  - hosts: all
    roles:
      - ferrarimarco.ruby-install
```


## Testing the role
This role is tested with [Test-Kitchen](https://github.com/test-kitchen/test-kitchen) configured with the [kitchen-docker](https://github.com/test-kitchen/kitchen-docker) driver,
and [kitchen-inspec](https://github.com/chef/kitchen-inspec).

### Dependencies

- Bundler, 1.13.0+
- Ruby, 2.3.0+
- Docker, 1.13.0+

### Run tests

1. Install Bundler: `gem install bundler`
1. Install required gems from inside the root of the project: `bundle install`
1. Run `kitchen test`
