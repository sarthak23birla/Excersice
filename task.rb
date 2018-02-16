number_of_product = gets.chomp.to_i
while number_of_product != 0
	commodity_data = gets.chomp   #String 1 to take input of commodity
	commodity_price = gets.chomp  #String 2  to take input of prices
	array_commodity_data  = commodity_data.split(",")
	array_commodity_price = commodity_price.split(",").map{|e| e.to_i}
	if (array_commodity_price.length == array_commodity_data.length)	
		food_grains = ["rice","wheat"] # 0%
		furniture = ["table","sofa","chair"] # 5%
		electronics =["mobile","tv","tablets"] # 18%
		cosmetics = ["beauty_cream","perfume"] # 28%
		overall_price = 0 #Set to 0 for each test case
		error_in_billing = false
		for _index in (0...array_commodity_price.length)
			product_count,product = array_commodity_data[_index].split(" ")
			product_count = product_count.to_i #Convert the String to integer
			intial_price = array_commodity_price[_index] * product_count  #intial_prices
			if(food_grains.include?(product))
				gst_price = (0*intial_price) #0% slab gst_price
			elsif(furniture.include?(product))
				gst_price = (0.05*intial_price) #5% slab gst_price
			elsif(electronics.include?(product))
				gst_price = (0.18*intial_price) #18% slab gst_price
			elsif(cosmetics.include?(product))		
				gst_price = (0.28*intial_price) #28% slab gst_price
			else
				p "Invalid Product:#{product}"
				error_in_billing = true # Error in billing because Product Invalid  
				break
			end
			p "The GST per unit: #{gst_price/product_count}"
			price_including_gst = intial_price + gst_price
			overall_price += price_including_gst
		end
		if(error_in_billing)
			p "There was a error in billing"
		else
			p "The Overall price is #{overall_price}"
		end
	else
		p "Invalid Data Entry"
	end
	number_of_product = number_of_product - 1
end