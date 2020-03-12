require 'yaml'

control "ansible-role-ruby-install" do
  title "ansible-role-ruby-install role check"

  config = YAML.load_file('defaults/main.yml')
  version = config['ruby_install_version']

  describe directory('/usr/local/share/doc/ruby-install-' + version) do
      it { should exist }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_readable.by_user('root') }
  end

  describe file('/tmp/ruby-install-' + version + '.tar.gz') do
      it { should_not exist }
  end

  describe directory('/tmp/ruby-install-' + version) do
      it { should_not exist }
  end

  describe file('/usr/local/bin/ruby-install') do
      it { should exist }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_readable.by_user('root') }
      its('mode') { should cmp '0755' }
  end
end
