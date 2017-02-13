class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def all_parks
    @parks = Park.all
  end

  helper_method :all_parks
end
