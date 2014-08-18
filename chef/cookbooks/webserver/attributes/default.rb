case node["platform"]
when "debian", "ubuntu"
  default['webserver']['package_name'] = 'apache2'
  default['webserver']['dir'] = '/var/www'
when "redhat", "centos", "fedora", "suse"
  default['webserver']['package_name'] = 'httpd'
  default['webserver']['dir'] = '/var/www/html'
end