require 'will_paginate/array'

class Comfy::Admin::DashboardController < Comfy::Admin::Cms::BaseController
  before_action :ensure_authority_to_manage_web
  before_action :set_visit, only: [:visit]
  def dashboard
    params[:q] ||= {}
    @visits_q = Subdomain.current.ahoy_visits.ransack(params[:q])
    @visits = @visits_q.result.paginate(page: params[:page], per_page: 10)
  end

  def visit
    @visit_specific_events_q = Ahoy::Event.where(visit_id: @visit.id).ransack(params[:q])
    @visit_specific_events = @visit_specific_events_q.result.paginate(page: params[:page], per_page: 10)
  end

  def events_detail
    @events_q = Ahoy::Event.where(name: params[:ahoy_event_type]).joins(:visit).ransack(params[:q])
    @events = @events_q.result.paginate(page: params[:page], per_page: 10)
  end

  def events_list
    @events_list_q = Ahoy::Event.group(:name).select("DISTINCT(name) AS distinct_name", "MIN(time) AS first_created_at", "MIN(id) AS id", "COUNT(name) AS count").order(:name).ransack(params[:q])
    @events_list = @events_list_q.result.paginate(page: params[:page], per_page: 10)
  end

  private

  def set_visit
    @visit = Ahoy::Visit.find_by(id: params[:ahoy_visit_id])
  end
end
