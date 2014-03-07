

case node[:platform]  #checks the user platform
when "ubuntu","debian"
     execute "Installing mysql-server" do
          command "apt-get -y install mysql-server"  #command to install mysql server and "-y" is to  accept & proceed
            
          action :run
     end


when "cent-os","redhat","fedora"
     execute "Installing mysql-server" do
          command "yum -y install mysql-server"      #command to install mysql server and "-y" is to  accept & proceed
          action :run
     end
end

if node["platform"] == "ubuntu"
 script "install_mysql-server" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
   code <<-EOH
      export DEBIAN_FRONTEND=noninteractive
     apt-get update
     apt-get -y install mysql-server
     debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password 'root''
     debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again 'root''
   EOH
 end
end




  code <<-EOH

     export DEBIAN_FRONTEND=noninteractive
     apt-get update
     apt-get -y install mysql-server
     debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password 'root''
     debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again 'root''
   EOH



#::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
#::Chef::Recipe.send(:include, Opscode::Mysql::Helpers)

#if Chef::Config[:solo]
#  missing_attrs = %w[
#    server_debian_password
#    server_root_password
#    server_repl_password
#  ].select { |attr| node['mysql'][attr].nil? }.map { |attr| %Q{node['mysql']['#{attr}']} }

#  unless missing_attrs.empty?
#    Chef::Application.fatal! "You must set #{missing_attrs.join(', ')} in chef-solo mode." \
#    " For more information, see https://github.com/opscode-cookbooks/mysql#chef-solo-note"
#  end
#else
#  # generate all passwords
#  node.set_unless['mysql']['server_debian_password'] = secure_password
#  node.set_unless['mysql']['server_root_password']   = secure_password
#  node.set_unless['mysql']['server_repl_password']   = secure_password
#  node.save
#end

#case node['platform_family']
#when 'rhel'
#  include_recipe 'mysql::_server_rhel'
#when 'debian'
#  include_recipe 'mysql::_server_debian'
#end
