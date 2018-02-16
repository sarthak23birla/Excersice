t=gets.chomp.to_i
while t!=0
	input_string = gets.chomp # Input String Details of Commodity 
	input_price = gets.chomp	# Input Details of Price
	ar_input_string = input_string.split(",")
	ar_input_price = input_price.split(",").map{|e| e.to_i}
	if(ar_input_string.length == ar_input_price.length)
		food_grain = ["rice" ,"wheat"] # 0 %
		furniture = ["table","sofa","chair"] # 5%
		electronics = ["mobile","tv","table"] # 18%
		cosmetics =["beauty_cream","cream","perfume"] # 28%
		overall_cost = 0 
		for i in (0...ar_input_string.length)	
			 # overall from one Commodity
			input_count,input_type = ar_input_string[i].split(" ") #spliting 
			input_count = input_count.to_i
			input_type.downcase!
			if(food_grain.include?(input_type)) # Checking in Which Category it is lies
				base_price =(ar_input_price[i]*input_count) # base price 
				puts "GST Applicable per unit: 0" 
				overall_cost += base_price #For multiple input add the values
			elsif(furniture.include?(input_type))
				base_price = input_count*ar_input_price[i]
				commodity_price = (base_price)+(0.05*base_price)
				puts "GST Applicable per unit :#{base_price*0.05/input_count}"
				overall_cost +=  commodity_price
			elsif(electronics.include?(input_type))
				base_price = input_count*ar_input_price[i]
				commodity_price = (base_price)+(0.18*base_price)
				puts "GST Applicable:#{base_price*0.18/input_count}"
				overall_cost +=  commodity_price
			elsif(cosmetics.include?(input_type))
				base_price = input_count*ar_input_price[i]
				commodity_price = (base_price)+(0.28*base_price)
				puts "GST Applicable:#{base_price*0.28/input_count}"
				overall_cost +=  commodity_price
			else
				puts "Commodity Not Found"
			end
		end
			puts "Overall Price after GST is:#{overall_cost}"

	else
		p "Invalid Data Entry"
	end
	t=t-1
end