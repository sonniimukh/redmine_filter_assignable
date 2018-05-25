require_dependency 'issue'

class Issue
  
  def assignable_users_with_filter_assignable      	

    users = []
    users << author      if author      && author.active?      && Setting.plugin_redmine_filter_assignable['include_author'] == "true"
    users << assigned_to if assigned_to && assigned_to.active? && Setting.plugin_redmine_filter_assignable['include_assignee'] == "true"

    types = []
    types << 'User'  if Setting.plugin_redmine_filter_assignable['allow_users']  == "true" 
    types << 'Group' if Setting.plugin_redmine_filter_assignable['allow_groups']  == "true"
    if !types.empty?
      users += project
        .assignable_users
        .where(:type => types)
        .where("role_id IN (?)", WorkflowTransition.where(:tracker_id => tracker_id, :old_status_id => status_id).select(:role_id).distinct.map { |e| e.role_id })
        .to_a
    end
    
    users.uniq.sort
  end

  alias_method_chain :assignable_users, :filter_assignable

end