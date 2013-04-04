#
# Cookbook Name:: mahout
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
name = "mahout"
filename = "#{name}-distribution-0.7"
ext = ".tar.gz"
install_dir = "/usr/local"
remote_uri = "http://ftp.riken.jp/net/apache/mahout/0.7/#{filename + ext}"

remote_file "/tmp/#{filename + ext}" do
  source "#{remote_uri}"
end

script "install_maven" do
  interpreter "zsh"
  user "root"
  code <<-EOL
    tar zxvf /tmp/#{filename + ext} -C #{install_dir}
    ln -s #{install_dir}/#{filename} #{install_dir}/#{name}
  EOL
end
