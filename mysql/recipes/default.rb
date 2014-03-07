#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# To install the MySql-Server 


if node["platform"] == "ubuntu"
 template "/tmp/default" do
  source "default.erb"
  mode "0777"
 end


 execute "Installing mysql-server" do
   command "cat /tmp/default | debconf-set-selections"
 end


 apt_package "mysql-server" do
    action :install
    options "--force-yes"
 end

 service "mysql" do
    supports :status => true, :restart => true, :reload => true
    action [ :enable, :start ]
 end
 

end

#bash "install_mysql-server" do
#  code <<-EOH
#    cat /tmp/default | debconf-set-selections
#    apt-get -y install mysql-server
#  EOH
# end
#end

#code <<-EOH
#  cat /tmp/default | debconf-set-selections
# EOH
#end


#case node[:platform]  #checks the user platform
#when "ubuntu","debian"
#     execute "Installing mysql-server" do
#when "cent-os","redhat","fedora"
 #    execute "Installing mysql-server" do
   #       command "yum -y install mysql-server"      #command to install mysql server and "-y" is to  accept & proceed
      #    action :run
     #end
#eexecute "Installing mysql-server" do
          ##command "apt-get -y install mysql-server"  #command to install mysql server and "-y" is to  accept & proceed
     #end
#end


#file "/etc/password" do  # creates a file for the password
#  content "Enter the password" #default where user must replace by there password
#end

#template "/etc/hosts_password" do  #creating a template for the hosts_password
#  source "hosts_password.erb"
#  mode 0755
#  variables({
#        :password=>"#{node['hosts_password']}" #now the password which the user has entered will be replaced in the .erb file 
#          })
#end

# This will work only for mysql on ubuntu, but not centos etc.
