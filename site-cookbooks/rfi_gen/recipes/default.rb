#
# Cookbook Name:: rfi_gen
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mysql::server"
include_recipe "mysql::client"
include_recipe "database::mysql"
include_recipe "java::default"
include_recipe "play::default"

package "lsof"

mysql_database "rfi_gen" do
    connection(
        :host       => 'localhost',
        :username   => 'root',
        :password   => node['mysql']['server_root_password']
    )
    action :create
end

mysql_database "rfi_gen_test" do
    connection(
        :host       => 'localhost',
        :username   => 'root',
        :password   => node['mysql']['server_root_password']
    )
    action :create
end

execute "echo 'export PATH=$PATH:/opt/play' >> /home/vagrant/.bash_profile" do
    user "vagrant"
    not_if "grep \/play /home/vagrant/.bash_profile", :user => "vagrant"
end

execute "/opt/play/play dependencies" do
    cwd "/srv/rfi_gen"
    user "vagrant"
    not_if { ::File.exists?("/srv/rfi_gen/modules")}
end

bash "run.sh" do
    path ["/opt/play", "/bin"]
    code <<-EOH
    source /home/vagrant/.bash_profile
    ./run.sh&
    EOH
    cwd "/srv/rfi_gen"
    not_if "sudo lsof -i TCP:9000"
end
