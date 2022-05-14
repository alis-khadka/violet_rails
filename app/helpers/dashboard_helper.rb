module DashboardHelper
  def redact_private_urls(url)
    should_exclude = false
    return if !url
    exclusions = Subdomain::PRIVATE_URL_PATHS
    exclusions.each do |exclusion|
      if url.include?(exclusion)
        should_exclude = true
      end
    end
    if should_exclude
      "private-system-url-redacted"
    else
      url
    end
  end

  def session_detail_title
    return 'Visit' if params[:id].blank?

    user_visit_count = Ahoy::Visit.where(user_id: params[:id]).where('started_at <= ?', @visit.started_at).size
    "Visit (#{user_visit_count})"
  end

  def events_detail_url(visit_id, event_type)
    return user_sessions_visit_events_admin_user_url(id: params[:id], ahoy_visit_id: visit_id, ahoy_event_type: event_type) if params[:id].present?
    dashboard_visit_events_url(ahoy_visit_id: visit_id, ahoy_event_type: event_type)
  end
end
