#
# Cookbook Name:: hadoop
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
name = "hadoop"
version = node['hadoop']['version']
ext = ".tar.gz"
install_dir = "/usr/local"
remote_uri = "http://ftp.tsukuba.wide.ad.jp/software/apache/hadoop/common/hadoop-#{version}/#{name}-#{version + ext}"

remote_file "/tmp/#{name}-#{version + ext}" do
  source "#{remote_uri}"
end

script "install_maven" do
  interpreter "zsh"
  user "root"
  code <<-EOL
    tar zxvf /tmp/#{name}-#{version + ext} -C #{install_dir}
    ln -s #{install_dir}/#{name}-#{version} #{install_dir}/#{name}
  EOL
end
