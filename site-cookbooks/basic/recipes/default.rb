#
# Cookbook Name:: basic
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{git zsh gcc make readline-devel}.each do |pkg|
  package pkg do
    action :install
  end
end
