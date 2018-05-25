require_dependency 'Issues/patches/IssueController_patch'

Redmine::Plugin.register :redmine_filter_assignable do
  name 'Redmine Filter Assignable plugin'
  author 'Luis Roa, edits by Eugene G'
  description 'Plugin to filter assignable users based on workflow'
  version '0.0.2'
  url 'https://github.com/sonniimukh/redmine_filter_assignable'
  author_url 'www.google.com/+LuisRoa'

  settings  :partial => 'settings/redmine_filter_assignable_settings',
    :default => {
      'allow_users' => 'true',
      'allow_groups' => 'true',
      'include_author' => 'false',
      'include_assignee' => 'false',
    }
end
