#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#
package 'apache2'

service 'apache2' do
  action [:start, :enable]
end

template '/var/www/index.html' do
  source 'index.html.erb'
end
