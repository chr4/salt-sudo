control 'sudo' do
  title 'should be installed & configured'

  describe package('sudo') do
    it { should be_installed }
  end

  describe file('/etc/sudoers') do
    its('mode') { should cmp '0440' }
    its('content') { should match /Defaults env_reset/ }
    its('content') { should match /Defaults env_keep\+=HOME/ }
    its('content') { should match /Defaults env_keep\+=SSH_CLIENT/ }
    its('content') { should match /Defaults env_keep\+=SSH_CONNECTION/ }
    its('content') { should match /Defaults env_keep\+=SSH_TTY/ }
    its('content') { should match /Defaults env_keep\+=SSH_AUTH_SOCK/ }
    its('content') { should match /Defaults secure_path="\/usr\/local\/sbin:\/usr\/local\/bin:\/usr\/sbin:\/usr\/bin:\/sbin:\/bin:\/snap\/bin"/ }
    its('content') { should match /root ALL=\(ALL\) ALL/ }
    its('content') { should match /#includedir \/etc\/sudoers.d/ }
  end
end
