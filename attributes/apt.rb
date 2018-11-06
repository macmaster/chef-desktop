# Cookbook Name:: desktop
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

# period in seconds to run apt-get update
default['desktop']['apt']['period'] = 8 * 3600

# track upstream (sid)
default['desktop']['apt']['sources']['upstream'].tap do |upstream|
  upstream['mirror'] = 'http://ftp.us.debian.org/debian'
  upstream['dist'] = 'sid'
  upstream['components'] = %w(main contrib non-free)
end

# security updates
default['desktop']['apt']['sources']['security'].tap do |security|
  security['mirror'] = 'http://security.debian.org/debian-security'
  security['dist'] = 'buster/updates'
  security['components'] = %w(main)
end
