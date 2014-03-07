#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# To install the MySql

if node["platform"] == "centos" or "redhat"

currentpassword=node[:password]
  
# template "/tmp/default" do
#    source "default.erb"
#    mode "0777"
#   end

 #execute "Installing mysql-server" do
 #      command "cat /tmp/default | debconf-set-selections"
 # end
 
 code <<-ZXC
     echo #{currentpassword} >> /root/centtest
   end
 ZXC
 
 yum_package "mysql-server" do
    action :install
    options "--force-yes"
 end
end


