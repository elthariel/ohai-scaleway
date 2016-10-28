#
# Cookbook Name:: ohai-scaleway
# Recipe:: default
#
# Copyright 2016, Julien \'lta\' BALLET
#
# All rights reserved - Do Not Redistribute
#

chef_dir = File.dirname(Chef::Config['config_file'])

ohai_plugin 'scaleway' do
  # not_if { File.exists? "#{chef_dir}/ohai/plugins/scaleway.rb"}
  action :create
end
