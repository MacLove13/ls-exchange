
namespace :admin do
  desc 'Create initial admin config'
  task create: :environment do
  	Admin.create(add_value_max: 0, add_value_min: 0, profit_quotes_sold: 0)
  end
end