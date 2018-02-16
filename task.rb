def product_gst_slab_evaulation(product)
	food_grains = ["rice","wheat"];furniture = ["table","sofa","chair"];electronics =["mobile","tv","tablets"];cosmetics = ["beauty_cream","perfume"] # 28%
	return 0    if food_grains.include?(product)
	return 0.05 if furniture.include?(product)
	return 0.18 if electronics.include?(product)
	return 0.28 if cosmetics.include?(product)
	return nil
end

def calculate_gst(overall_price,commodity_price,product_count,gst_percentage)
	intial_price = commodity_price * product_count
	price_including_gst = intial_price + intial_price * gst_percentage
	overall_price += price_including_gst
	puts "The GST per unit rate:#{intial_price * gst_percentage/product_count}"
	return overall_price 
end

def calculate_overall_price(commodity_datas,commodity_prices)
	overall_price = 0
	for _index in (0...commodity_prices.length)
		product_count,product = commodity_datas[_index].split(" ");gst_percentage = product_gst_slab_evaulation(product)
		overall_price = calculate_gst(overall_price,commodity_prices[_index],product_count.to_i,gst_percentage)
		if (gst_percentage.nil?)
			p "Billing not Possible"
			break
		end
	end
	puts  "Overall Price:#{overall_price}"
end

def array_length_equal(commodity_datas,commodity_prices)
	return  calculate_gst_and_overall_price(commodity_datas,commodity_prices) if(commodity_datas.length==commodity_prices.length)
	return nil  
end

number_of_product = gets.chomp.to_i
while number_of_product != 0
	commodity_data = gets.chomp.split(",")   #String 1 to take input of commodity
	commodity_price = gets.chomp.split(",").map{|e| e.to_i}  #String 2  to take input of prices
	if (array_length_equal(commodity_data,commodity_price).nil?)
		p " not valid "
	end
	number_of_product = number_of_product-1
end