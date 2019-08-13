namespace :business do
  desc 'Atualizar ações'
  task :update => :environment do
	business = Business.all

	business.each do |biz|
		lastHistory = BusinessValueHistory.where(business_id: biz.id).order('id DESC').limit(1)

		history = lastHistory.last
		value = history.value

		valueMax = value + rand * rand(15)
		valueMin = value - rand * rand(15)

		# Critical Change
		critical_positive = rand(15).to_i
		valueMax = valueMax + rand * rand(15) if critical_positive == 5

		critical_negative = rand(15).to_i
		valueMin = valueMin - rand * rand(20) if critical_positive == 5

		# Calcule final value and round
		valueFinal = rand * (valueMax-valueMin) + valueMin
		valueFinal = valueFinal.round(2)

		valueFinal = 0.1 if valueFinal < 0

		BusinessValueHistory.create(business_id: biz.id, value: valueFinal)
	end
	puts 'Valores de acoes atualizados'
end
end