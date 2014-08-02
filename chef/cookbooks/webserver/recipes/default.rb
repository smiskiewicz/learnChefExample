#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#

case node["platform"]
when "debian", "ubuntu"
  apacheName = "apache2"
  wwwLocation = "/var/www"
when "redhat", "centos", "fedora"
  apacheName = "httpd"
  wwwLocation = "/var/www/html"
end

package apacheName

service apacheName do
  action [:start, :enable]
end

template "#{wwwLocation}/index.html" do
  source 'index.html.erb'
end
