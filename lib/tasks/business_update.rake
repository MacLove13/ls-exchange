namespace :business do
  desc 'Atualizar ações'
  task :update => :environment do
  	business = Business.all

    admin_config = Admin.find(1)

  	business.each do |biz|
  	  lastHistory = BusinessValueHistory.where(business_id: biz.id, bankrupt: false).order('id DESC').limit(1)

      history = lastHistory.last
      value = history.value

      if value == 1
        biz.update_attributes(bankrupt: true, available_quotes: 0)
        next
      end

      total_quotes = biz.purchased_quotes + biz.available_quotes
      total_purchased_quotes = total_quotes - biz.available_quotes

      if total_purchased_quotes > (total_quotes * 0.8)
        rand_value_max = 7
        rand_value_min = 7

        positive_chance = 50
        negative_chance = 40

        hard_positive_chance = 150
        hard_negative_chance = 130
      elsif total_purchased_quotes > (total_quotes * 0.5)
        rand_value_max = 10
        rand_value_min = 10

        positive_chance = 40
        negative_chance = 30

        hard_positive_chance = 120
        hard_negative_chance = 100
      elsif total_purchased_quotes > (total_quotes * 0.25)
        rand_value_max = 14
        rand_value_min = 14

        positive_chance = 30
        negative_chance = 25

        hard_positive_chance = 100
        hard_negative_chance = 90
      else
        rand_value_max = 17
        rand_value_min = 17

        positive_chance = 25
        negative_chance = 22

        hard_positive_chance = 90
        hard_negative_chance = 80
      end

  		value_max = value + rand * rand(rand_value_max)
  		value_min = value - rand * rand(rand_value_min)

  		value_max = value_max + admin_config.add_value_max if admin_config.add_value_max != 0
      value_min = value_min + admin_config.add_value_min if admin_config.add_value_min != 0

  		# Critical Change
  		# ===============================================================
  		# Positive
  		critical_positive = rand(positive_chance).to_i
  		value_max = value_max + rand * rand(15) if critical_positive == 5

  		critical_positive_hard = rand(hard_positive_chance).to_i
  		value_max = value_max + rand * rand(50) if critical_positive_hard == 10

  		# ===============================================================
  		# Negative
  		critical_negative = rand(negative_chance).to_i
  		value_min = value_min - rand * rand(15) if critical_negative == 5

  		critical_negative_hard = rand(hard_negative_chance).to_i
  		value_min = value_min - rand * rand(50) if critical_negative_hard == 10

  		# Calcule final value and round
  		# ===============================================================
  		value_final = rand * (value_max-value_min) + value_min
  		value_final = value_final.round(2)

  		if value_final < 80
  		  falencia = rand(10)

  		  if falencia < 1
          biz.update_attributes(bankrupt: true, available_quotes: 0)
          value_final = 1 
        end
  		end

      if value_final < 40
        biz.update_attributes(bankrupt: true, available_quotes: 0)
    		value_final = 1
      end

  		value_final = 50 if value_final != 1 && value_final < 50

  		BusinessValueHistory.create(business_id: biz.id, value: value_final)
  	end
    puts 'Valores de acoes atualizados'

    BusinessValueHistory.where('created_at < ?', 1.days.ago).each do |model|
      biz = Business.find(model.business_id)
      next if biz.bankrupt == true

      model.destroy
    end
    puts 'Marcações velhas removidas'
  end
end

# editorconfig.org dot file
# Filipe Deschamps
