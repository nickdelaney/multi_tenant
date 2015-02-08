class Preschool < ActiveRecord::Base
  belongs_to :franchise

filterrific(
  available_filters: [
    :sorted_by,
    :search_query
  ]
)
end
