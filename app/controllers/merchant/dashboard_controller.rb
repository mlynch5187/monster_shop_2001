class Merchant::DashboardController < ApplicationController

  before_action :require_merchant

  def require_merchant
    render file: "/public/404" unless current_merchant?
  end

  def index
  end

end

#
# before_action :admin
# before_action :merchant
# before_action :user