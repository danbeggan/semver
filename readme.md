# Semantic version comparison

## Your task:
Implement a ruby class `Semver` that can be used to compare semantic versions. 

Your class should support the operators `<`, `>` and `==`. It should also implement a `#match?` method that matches against Gemfile version strings like `'~> 10.1'`.

### Examples
```
Semver.new('1.10') > Semver.new('2.10')   # => false
Semver.new('1.10') < Semver.new('2.10')   # => true

Semver.new('1.10') == Semver.new('1.10')  # => true

Semver.new('1.9.1').match?('~> 1.10')     # => false
Semver.new('1.10.1').match?('~> 1.10')    # => true
Semver.new('1.10.1').match?('> 1.10')     # => true
```

This is an incomplete set of examples, [here's more on the workings of ruby's "pessimistic" `~>` operator](https://thoughtbot.com/blog/rubys-pessimistic-operator).

## What we are looking for:
* Process of working documented by concise commits
* Clean, readable code
* Tests!

## Recommended time
2 - 4 hours

## Setup
`bundle`

## Tests
`bundle exec rspec ./spec/semver_spec.rb`

# Messy navigation helpers

The two methods `nav_primary` and `nav_secondary` inside the `HeaderNavigationHelper` are pretty convoluted:

```ruby
module HeaderNavigationHelper
  
  # lots of code cut here ...

  def nav_primary(client: false)
    if current_user
      nav = [
              {text: 'My Projects',     url: my_projects_path},
              {url: inbox_path,         block: ("Messages" + (current_user.unread_messages.present? ? " <span class=\"unread-messages\">#{current_user.unread_messages.count}<span>" : '')).html_safe}
            ]
      if current_user.client?
        nav.unshift({text: 'My Company',    url: company_dashboard_path})
      else
        nav.unshift({text: 'Find Projects', url: contests_path})
      end
    else
      nav = [
              {text: 'How it works',    url: profiles_path},
              {text: 'Blog',            url: "#{APP_URL}/blog"}
            ]
      if client
        nav.insert(1, {text: 'About Us',             url: "#{APP_URL}/about"})
      else
        nav.insert(0, {text: 'Browse Projects',   url: contests_path})
      end
    end
  end

  def nav_secondary
    if current_user
      nav = [
              {text: 'My Profile',      url: profile_path(current_profile)},
              {text: 'Settings',        url: edit_profile_path(current_profile)},
              {text: "Find #{current_user.try(:client?) ? 'Creatives' : 'Collaborators'}",    url: profiles_path},
            ]
      nav.unshift({text: 'Latest Ideas', url: contest_ideas_path(current_user.jury_in_contest)}) if current_user.jury_in_contest
      if original_user
        nav.push({text: '☯ Excarnate',  url: unpretend_path, options: {style: 'color: green'}})
      else
        nav.push({text: 'Log out',      url: logout_path})
      end
    else
      []
    end
  end
  
  # lots of code cut here ...
  
end
```


## Your task:
Please refactor them to make them more concise and clear. You probably want to write Minitest or Rspec specs before your refactoring, using mocks and stubs for non-existing methods like `current_user`.

## What we are looking for:
* Process of working documented by concise commits
* Clean, readable code
* Tests!

## Recommended time
1 - 3 hours