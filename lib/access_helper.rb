module AccessHelper
  extend ActiveSupport::Concern

  include AuthHelper

  def check_access(values = {})
    acl.check! self.class.to_s, self.action_name, current_roles, values
  end

  def can?(route_method, action = nil, options = {})
    url_options = send "hash_for_#{route_method}_path"
    resource = "#{url_options[:controller].to_s.camelize}Controller"
    privilege = action || url_options[:action]
    acl.allow? resource, privilege, current_roles, options
  end

  def current_roles
    @current_roles ||= current_user.roles
  end

  def acl
    YaAcl::Acl.instance
  end
end
