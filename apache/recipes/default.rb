#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "apache2" do
 action :install
end
service "apache2" do
 supports :restart => true, :reload => true
 action :enable
end
cookbook_file "/var/www/hi.html" do
 source "hi.html"
end
