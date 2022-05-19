class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods

  self.table_name = "ahoy_events"

  belongs_to :visit
  belongs_to :user, optional: true

  # For events_list page, sorting on the grouped query
  # https://stackoverflow.com/a/35987240
  ransacker :count do
    Arel.sql('count')
  end

  ransacker :first_created_at do
    Arel.sql('first_created_at')
  end

  ransacker :distinct_name do
    Arel.sql('distinct_name')
  end
end
