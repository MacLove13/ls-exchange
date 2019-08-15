namespace :business do
  desc 'Atualizar ações'
  task :update => :environment do
  	business = Business.all

  	business.each do |biz|
  		lastHistory = BusinessValueHistory.where(business_id: biz.id).order('id DESC').limit(1)

  		history = lastHistory.last
  		value = history.value

  		value_max = value + rand * rand(15)
  		value_min = value - rand * rand(15)

  		# Critical Change
  		# ===============================================================
  		# Positive
  		critical_positive = rand(25).to_i
  		value_max = value_max + rand * rand(15) if critical_positive == 5

  		critical_positive_hard = rand(110).to_i
  		value_max = value_max + rand * rand(50) if critical_positive_hard == 10

  		# ===============================================================
  		# Negative

  		critical_negative = rand(20).to_i
  		value_min = value_min - rand * rand(20) if critical_negative == 5

  		critical_negative_hard = rand(100).to_i
  		value_min = value_min - rand * rand(50) if critical_negative_hard == 10

  		# Calcule final value and round
  		# ===============================================================
  		value_final = rand * (value_max-value_min) + value_min
  		value_final = value_final.round(2)

  		value_final = 0.1 if value_final < 0

  		BusinessValueHistory.create(business_id: biz.id, value: value_final)
  	end
  	puts 'Valores de acoes atualizados'
  end
end

# editorconfig.org dot file
# Filipe Deschamps
