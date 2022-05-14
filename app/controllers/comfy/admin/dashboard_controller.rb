class Comfy::Admin::DashboardController < Comfy::Admin::Cms::BaseController
  before_action :ensure_authority_to_manage_web
  before_action :set_visit, only: [:visit, :events]
  def dashboard
    params[:q] ||= {}
    @visits_q = Subdomain.current.ahoy_visits.ransack(params[:q])
    @visits = @visits_q.result.paginate(page: params[:page], per_page: 10)
  end

  def visit
    @events = Ahoy::Event.where(visit_id: @visit.id)
  end

  def events
    @events = @visit.events.where(name: params[:ahoy_event_type])
  end

  private

  def set_visit
    @visit = Ahoy::Visit.find_by(id: params[:ahoy_visit_id])
  end
end
