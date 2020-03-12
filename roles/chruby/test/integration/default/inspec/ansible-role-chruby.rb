control "ansible-role-chruby" do
  title "ansible-role-chruby role check"

  config = YAML.load_file('defaults/main.yml')
  version = config['chruby_version']

  describe package('make') do
    it { should be_installed }
  end

  describe directory('/usr/local/share/doc/chruby-' + version) do
      it { should exist }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_readable.by_user('root') }
  end

  describe file('/etc/profile.d/chruby.sh') do
      it { should exist }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_readable.by_user('root') }
      its('mode') { should cmp '0644' }
  end

  describe file('/usr/local/share/chruby/chruby.sh') do
      it { should exist }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_readable.by_user('root') }
      its('mode') { should cmp '0644' }
  end

  describe file('/usr/local/share/chruby/auto.sh') do
      it { should exist }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_readable.by_user('root') }
      its('mode') { should cmp '0644' }
  end

  describe file('/etc/bash.bashrc') do
      it { should exist }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_readable.by_user('root') }
      its('mode') { should cmp '0644' }
      its('content') { should match(%r{chruby}) }
  end

  describe file('/tmp/chruby-' + version + '.tar.gz') do
      it { should_not exist }
  end

  describe directory('/tmp/chruby-' + version) do
      it { should_not exist }
  end
end
