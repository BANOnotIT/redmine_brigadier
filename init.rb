require 'redmine_brigadier'

ActiveSupport::Reloader.to_prepare do
  paths = '/lib/redmine_brigadier/{patches/*_patch,hooks/*_hook}.rb'
  Dir.glob(File.dirname(__FILE__) + paths).each do |file|
    require_dependency file
  end
end

Redmine::Plugin.register :redmine_brigadier do
  name 'Brigadier plugin'
  author 'Ivan Bobrenko'
  description 'Ensures that time spend on issues is in bounds of issues'
  version '0.2.0'
  url 'https://github.com/BANOnotIT/redmine_brigadier'
  author_url 'https://github.com/BANOnotIT'
end
