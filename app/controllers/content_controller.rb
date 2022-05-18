class ContentController < ApplicationController
  include AhoyVisitData

  before_action :track_or_create_ahoy_visit, raise: false
end
