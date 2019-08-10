namespace :business do
  desc 'Atualizar ações'
  task :update => :environment do
	business = Business.all

	business.each do |biz|
		lastHistory = BusinessValueHistory.where(business_id: biz.id).order('created_at DESC').limit(1)

		history = lastHistory.last
		value = history.value

		valueMax = value + rand(4)
		valueMin = value - rand(4)

		# Critical Change
		critical_positive = rand(10).to_i
		valueMax = valueMax + rand(10) if critical_positive == 5

		critical_negative = rand(10).to_i
		valueMin = valueMin - rand(20) if critical_positive == 5

		# Calcule final value and round
		valueFinal = rand * (valueMax-valueMin) + valueMin
		valueFinal = valueFinal.round(2)

		valueFinal = 0.1 if valueFinal < 0

		BusinessValueHistory.create(business_id: biz.id, value: valueFinal)
	end
	puts 'Valores de acoes atualizados'
end
end