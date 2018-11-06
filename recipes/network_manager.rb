# Cookbook Name:: desktop
# Recipe:: network_manager
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

# Declare and upgrade the service
package 'network-manager' do
  action :upgrade
end

service 'network-manager' do
  action :start
end

# Configure the service
conf_dir = '/etc/NetworkManager/conf.d'

# Disable nameserver management
file "#{conf_dir}/dns.conf" do
  notifies :restart, 'service[network-manager]'
  mode 0444
  content <<-EOT
    [main]
    dns=none
  EOT
end

# Use Google's DNS Server
file "/etc/resolv.conf" do
  mode 0644
  manage_symlink_source true
  content "nameserver 8.8.8.8"
end
