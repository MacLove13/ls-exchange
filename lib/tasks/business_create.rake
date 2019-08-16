# frozen_string_literal: true

namespace :business do
  desc 'Populate business and Value History'
  task create: :environment do

    # business = Business.create(name: 'San News', initials: 'SN', available_quotes: quotes, purchased_quotes: 0)
    # create_history(business.id)

    # business = Business.create(name: 'Ammu Nation', initials: 'AMMU', available_quotes: quotes, purchased_quotes: 0)
    # create_history(business.id)

    # business = Business.create(name: 'Burguer Shot', initials: 'BSHT', available_quotes: quotes, purchased_quotes: 0)
    # create_history(business.id)

    # business = Business.create(name: 'Binco', initials: 'BNC', available_quotes: quotes, purchased_quotes: 0)
    # create_history(business.id)

    # business = Business.create(name: 'CNT', initials: 'CNT', available_quotes: quotes, purchased_quotes: 0)
    # create_history(business.id)

    # business = Business.create(name: 'Brute', initials: 'BRT', available_quotes: quotes, purchased_quotes: 0)
    # create_history(business.id)

    # business = Business.create(name: 'BF', initials: 'BF', available_quotes: quotes, purchased_quotes: 0)
    # create_history(business.id)

    # business = Business.create(name: 'Victim', initials: 'VC', available_quotes: quotes, purchased_quotes: 0)
    # create_history(business.id)

    # business = Business.create(name: 'Solarim Autos', initials: 'SLA', available_quotes: quotes, purchased_quotes: 0)
    # create_history(business.id)

    # business = Business.create(name: 'Stacked', initials: 'STK', available_quotes: quotes, purchased_quotes: 0)
    # create_history(business.id)

    # business = Business.create(name: 'Transports LTDA', initials: 'LTDA', available_quotes: quotes, purchased_quotes: 0)
    # create_history(business.id)

    business = Business.create(name: 'Sprunk', initials: 'SPK', available_quotes: quotes, purchased_quotes: 0)
    create_history(business.id)

    business = Business.create(name: 'Patriot Beer', initials: 'PTB', available_quotes: quotes, purchased_quotes: 0)
    create_history(business.id)

    business = Business.create(name: 'Xoomer', initials: 'XM', available_quotes: quotes, purchased_quotes: 0)
    create_history(business.id)

    business = Business.create(name: 'CK Cigarettes', initials: 'CKC', available_quotes: quotes, purchased_quotes: 0)
    create_history(business.id)

    business = Business.create(name: 'Pibwasser', initials: 'PW', available_quotes: quotes, purchased_quotes: 0)
    create_history(business.id)

    business = Business.create(name: 'Soda', initials: 'SD', available_quotes: quotes, purchased_quotes: 0)
    create_history(business.id)

    business = Business.create(name: 'ECola', initials: 'ECL', available_quotes: quotes, purchased_quotes: 0)
    create_history(business.id)

    business = Business.create(name: 'Pissh', initials: 'PSS', available_quotes: quotes, purchased_quotes: 0)
    create_history(business.id)

    p 'Business created'
  end

  def quotes
    range(10, 40)
  end

  def range(min, max)
    rand * (max-min) + min
  end

  def create_history(business_id)
    25.times { 
      value = range(200, 3000)
      value = value.round(2)
      minute = range(0, 59)
      BusinessValueHistory.create(business_id: business_id, value: value, created_at: "2019-11-09 23:#{minute}:51")
    }
  end
end
