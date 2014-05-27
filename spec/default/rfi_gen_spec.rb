require 'spec_helper'

describe service('mysqld') do
  it { should be_running }
  it { should be_enabled }
end

describe file('/opt/play') do
  it { should be_directory }
end

describe command("mysql -u root -prfi_gen -e 'show databases;'") do
  its(:stdout) { should match /rfi_gen\s/ }
  its(:stdout) { should match /rfi_gen_test/ }
end

describe port(9000) do
  it { should be_listening }
end

describe file('/home/vagrant/.bash_profile') do
  it { should be_file }
  its(:content) { should match /\/play/ }
end
