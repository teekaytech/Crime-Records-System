class StaticController < ApplicationController
  def index
    redirect_to dashboard_index_path if current_user
  end
end
