# Configure the Chef Home
CHEF_HOME = "#{ENV['HOME']}/chef"

local_mode true
cookbook_path "#{CHEF_HOME}/cookbooks"
cache_path "#{CHEF_HOME}/cache"
file_cache_path "#{CHEF_HOME}/cache"
json_attribs "#{CHEF_HOME}/node.json"
