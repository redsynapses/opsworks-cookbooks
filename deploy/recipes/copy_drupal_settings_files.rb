#
# Cookbook Name:: deploy
# Recipe:: copy_drupal_settings_files
#
require 'aws-sdk'

s3 = AWS::S3.new

# Set bucket and object name
obj = s3.buckets['settings-file'].objects['settings.php']

# Read content to variable
file_content = obj.read

# Log output (optional)
Chef::Log.info(file_content)

# Write content to file
file '//srv/www/velldo/current/sites/default/settings.php' do
  owner 'root'
  group 'root'
  mode '0777'
  content file_content
  action :create
end
