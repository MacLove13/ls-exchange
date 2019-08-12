module BusinessHelper

  # Graphic 1 - Last Hour
  MAX_HISTORY_RECORDS = 100

	def generate_graph_date
		graph_data = []
    @min_value = 9999999
    @max_value = 0

    history = BusinessValueHistory.where(business_id: @business.id, created_at: (Time.now - 2.hours)..Time.now)

		history.each do |history|

      date = history.created_at.strftime("%H:%M")
      data = []
      data.push(date)
      data.push(history.value)

      @min_value = history.value if history.value < @min_value
      @max_value = history.value if history.value > @max_value

      graph_data.push(data)
    end

    graph_data
	end

  def max_value_graph
    (@max_value + 30).round
  end

  def min_value_graph
    (@min_value - 30).round
  end

  # Graphic 2 - Last Five Hours

  def generate_grapt_five_hours_date
    history_graph = BusinessValueHistory.where(business_id: @business.id, created_at: (Time.now - 5.hours)..Time.now)
    
    graph_data = []
    @min_value_hours = 9999999
    @max_value_hours = 0

    history_graph.each do |history|
      date = history.created_at.strftime("%H:%M")

      data = []
      data.push(date)
      data.push(history.value)

      @min_value_hours = history.value if history.value < @min_value_hours
      @max_value_hours = history.value if history.value > @max_value_hours

      graph_data.push(data)
    end
    graph_data
  end

  def max_value_five_hours
    @max_value_hours.round(2)
  end

  def min_value_five_hours
    @min_value_hours.round(2)
  end

  def max_value_five_hours_graph
    (@max_value_hours + 30).round
  end

  def min_value_five_hours_graph
    (@min_value_hours - 30).round
  end

  # ===========================


	def calculate_movimentation(valueHistory)
		valuesHistory = valueHistory.order('id DESC').limit(2).reverse

    	return 0 if valuesHistory.nil?

		first = valuesHistory.first
		last = valuesHistory.last

		finalValue = last.value.round(2) - first.value.round(2)
	end

	def calculate_variation(valueHistory)
		valuesHistory = valueHistory.order('id DESC').limit(2).reverse

		first = valuesHistory.first
		last = valuesHistory.last

		return 0 if first.value.round(2) == last.value.round(2)

		result = first.value.round(2) / last.value.round(2)
		result = result / first.value.round(2)
		result = result * 100
		result.round(2)
	end

	def define_icon(valueHistory)
		valuesHistory = valueHistory.order('id DESC').limit(2).reverse

		first = valuesHistory.first
		last = valuesHistory.last

		if last.value.round(2) == first.value.round(2)
			icon('fas', 'minus')
		elsif last.value.round(2) > first.value.round(2)
			icon('fas', 'arrow-up', class: 'arrow-up')
		else
			icon('fas', 'arrow-down', class: 'arrow-down')
		end
	end

	def action_value(valueHistory)
		valuesHistory = valueHistory.order('id DESC').limit(1).reverse
		valuesHistory = valuesHistory.last
		valuesHistory.value
	end

  def biz_available_quotes
    @business.verify_available_quotes
  end
end
