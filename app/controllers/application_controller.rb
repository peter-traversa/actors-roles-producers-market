class ApplicationController < ActionController::Base
  # skip_before_action :actor_authorized, :production_company_authorized, except: :destroy
  helper_method :current_actor
  helper_method :current_production_company
  helper_method :actor_logged_in
  helper_method :production_company_logged_in
  before_action :authorized, only: :destroy

  def current_actor
    @actor = Actor.find_by({ id: session[:actor_id] })
  end

  def current_production_company
    @production_company = ProductionCompany.find_by({ id: session[:production_company_id] })
  end

  def actor_logged_in
    !!current_actor()
  end

  def production_company_logged_in
    !!current_production_company()
  end

  def authorized
    redirect_to login_path unless actor_logged_in || production_company_logged_in
  end

end
