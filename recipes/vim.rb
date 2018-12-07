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

# vim configuration
VIM_HOME = ENV['HOME']
VIM_USER = ENV['SUDO_USER'] || ENV['USER']
VIM_PLUGINS = ".vim/pack/vim/start"
VIM_RC = ".vimrc"

# Create a .vimrc
template File.join(VIM_HOME, VIM_RC) do
  source 'vim/.vimrc'
  owner VIM_USER
  group VIM_USER
end

# Create the plugins directory
# Use the built in package system for vim 8+

# Plugins are managed completely by chef (root:root)
directory File.join(VIM_HOME, VIM_PLUGINS)

# Install some vim packages
plugin_repos = %w(
  https://github.com/pangloss/vim-javascript.git
  https://github.com/mxw/vim-jsx.git
)

plugin_repos.map do |repo|
  plugin = File.basename(repo, '.git')
  path = File.join(VIM_HOME, VIM_PLUGINS, plugin)

  git path do
    repository repo
  end
end
