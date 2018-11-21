# Cookbook Name:: desktop
# Recipe:: vagrant
#
# Copyright 2015 Andrew Jones
# Modified by: Ronald Macmaster
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Installs vagrant on Debian/Ubuntu.

include_recipe 'desktop::virtualbox'

version, arch = '2.2.0', 'x86_64'
vagrant_dpkg = "vagrant_#{version}_#{arch}.deb"

vagrant_sha256 =
  'f1caad948a8f545d5d7d2442396fe8a3bcdfd0fc8f643bd0576c81942e7be43b'

vagrant_url =
  "https://releases.hashicorp.com/vagrant/#{version}/#{vagrant_dpkg}"

vagrant_path =
  "#{Chef::Config[:file_cache_path]}/#{vagrant_dpkg}"

remote_file vagrant_path do
  source vagrant_url
  checksum vagrant_sha256
end

dpkg_package 'vagrant' do
  source vagrant_path
  action :upgrade
end
