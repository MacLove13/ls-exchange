# frozen_string_literal: true

namespace :business do
  desc 'Populate business and Value History'
  task :create do

    business = Business.create(name: 'San News')
    create_history(business.id)

    business = Business.create(name: 'Ammu Nation')
    create_history(business.id)

    business = Business.create(name: 'Burguer Shot')
    create_history(business.id)

    business = Business.create(name: 'Binco')
    create_history(business.id)

    business = Business.create(name: 'CNT')
    create_history(business.id)

    business = Business.create(name: 'Brute')
    create_history(business.id)

    business = Business.create(name: 'BF')
    create_history(business.id)

    business = Business.create(name: 'Victim')
    create_history(business.id)

    p 'Business created'
  end

  def range(min, max)
    rand * (max-min) + min
  end

  def create_history(business_id)
    25.times { 
      value = range(40, 120)
      value = value.round(2)
      minute = range(0, 59)
      BusinessValueHistory.create(business_id: business_id, value: value, created_at: "2019-08-09 23:#{minute}:51")
    }
  end
end
