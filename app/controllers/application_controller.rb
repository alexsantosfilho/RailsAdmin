class ApplicationController < ActionController::Base
    config.parent_controller = 'ApplicationController'
    rescue_from CanCan::AccessDenied do |exception|
        Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
        # ...
    end
end
