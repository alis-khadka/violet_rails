class ContentController < ApplicationController
  before_action :track_ahoy_visit, raise: false
end
