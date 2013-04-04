#
# Cookbook Name:: solr
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
name = "solr"
version = node['solr']['version']
ext = ".tgz"
install_dir = "/usr/local"
filename = if version[0, 1].to_i == 3
             "apache-#{name}-#{version}"
           else
             "#{name}-#{version}"
           end
remote_uri = "http://ftp.riken.jp/net/apache/lucene/solr/#{version}/#{filename + ext}"

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
