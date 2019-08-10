# frozen_string_literal: true

namespace :business do
  desc 'Populate business and Value History'
  task :create do
    Business.create(name: 'San News', value: 200)

    business = Business.last

    BusinessValueHistory.create(business_id: 6, value: 50, created_at: "2019-08-09 23:42:51")

    p 'Business created'
  end
end
