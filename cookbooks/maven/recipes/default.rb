#
# Cookbook Name:: maven
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
name = "maven"
filename = "apache-#{name}-3.0.5"
ext = ".tar.gz"
install_dir = "/usr/local"
remote_uri = "http://ftp.riken.jp/net/apache/maven/maven-3/3.0.5/binaries/#{filename}-bin#{ext}"

remote_file "/tmp/#{filename}-bin#{ext}" do
  source "#{remote_uri}"
end

script "install_maven" do
  interpreter "zsh"
  user "root"
  code <<-EOL
    tar zxvf /tmp/#{filename}-bin#{ext} -C #{install_dir}
    ln -s #{install_dir}/#{filename} #{install_dir}/#{name}
  EOL
end
