module HeaderNavigationHelper
  
  # lots of code cut here ...

  def nav_primary(client: false)
    nav = []
    if current_user
      nav << current_user.client? ? {text: 'My Company',    url: company_dashboard_path} : {text: 'Find Projects', url: contests_path}
      nav << {text: 'My Projects',     url: my_projects_path}
      nav << {url: inbox_path,         block: ("Messages" + (current_user.unread_messages.present? ? " <span class=\"unread-messages\">#{current_user.unread_messages.count}<span>" : '')).html_safe}
    else
      nav << client ? {text: 'About Us',             url: "#{APP_URL}/about"} : {text: 'Browse Projects',   url: contests_path}
      nav << {text: 'How it works',    url: profiles_path}
      nav << {text: 'Blog',            url: "#{APP_URL}/blog"}
    end
    nav
  end

  def nav_secondary
    nav = []
    if current_user
      nav << {text: 'Latest Ideas', url: contest_ideas_path(current_user.jury_in_contest)} if current_user.jury_in_contest
      nav << {text: 'My Profile',      url: profile_path(current_profile)}
      nav << {text: 'Settings',        url: edit_profile_path(current_profile)}
      nav << {text: "Find #{current_user.try(:client?) ? 'Creatives' : 'Collaborators'}",    url: profiles_path}
      nav << original_user ? {text: '☯ Excarnate',  url: unpretend_path, options: {style: 'color: green'}} : {text: 'Log out',      url: logout_path}
    end
    nav
  end
  
  # lots of code cut here ...
  
end