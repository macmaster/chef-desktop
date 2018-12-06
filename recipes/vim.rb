# Cookbook Name:: desktop
# Recipe:: vim
#
# Upgrades, and sets up vim.
# Adds a few useful plugins as well.
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

include_recipe 'desktop::git'

package 'vim' do
  action :upgrade
end

template "#{ENV['HOME']}/.vimrc" do
  source 'vim/.vimrc'
end
