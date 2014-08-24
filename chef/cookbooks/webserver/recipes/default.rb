#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#

package node["webserver"]["package_name"]

service node["webserver"]["package_name"] do
  action [:start, :enable]
end

template "#{node["webserver"]["dir"]}/index.html" do
  source 'index.html.erb'
  owner "root"
  group "root"
  mode "0644"
end
