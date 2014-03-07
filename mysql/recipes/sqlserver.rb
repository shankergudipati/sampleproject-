# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# To install the MySql
#

if node["platform"] == "ubuntu"
 script "install_mysql-server" do
  interpreter "bash"
  user "root"
  cwd "/tmp" 
   code <<-EOH
    apt-get -y install mysql-server
   EOH
 end
end   

file "/etc/password" do
 content "Enter the password" 
end

template "/etc/hosts_password" do  #creating a template for the hosts_password
  source "hosts_password.erb"
  mode 0777
  variables({
        :password=>"#{node['hosts_password']}" #now the password which the user has entered will be replaced in the .erb file
          })
end

# Complete it.
