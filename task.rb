def product_gst_slab_evaulation(product)
	food_grains = ["rice","wheat"] # 0%
	furniture = ["table","sofa","chair"] # 5%
	electronics =["mobile","tv","tablets"] # 18%
	cosmetics = ["beauty_cream","perfume"] # 28%
	if(food_grains.include?(product))
		return 0 #0% slab gst_price
	elsif(furniture.include?(product))
		return 0.05 #5 % slab gst_price
	elsif(electronics.include?(product))
		return 0.18 #18% slab gst_price
	elsif(cosmetics.include?(product))		
		return 0.28 #28% slab gst_price
	end
	return nil
end
def display_details(array_gst_price,overall_price)
	p "The gst price are:#{array_gst_price.join(",")}"
	p "Overall Price:#{overall_price}"
end

def calculate_gst_and_overall_price(array_commodity_data,array_commodity_price)
	overall_price = 0
	per_unit_gst_of_product = Array.new()
	for _index in (0...array_commodity_price.length)
		product_count,product = array_commodity_data[_index].split(" ")
		product_count = product_count.to_i #Convert the String to integer
		intial_price = array_commodity_price[_index] * product_count  #intial_prices
		gst_percentage = product_gst_slab_evaulation(product)
		if (gst_percentage.nil?)
			p "Billing not Possible"
			break
		end
		gst_price = intial_price * gst_percentage
		price_including_gst = intial_price + gst_price
		overall_price += price_including_gst
		per_unit_gst_of_product.push(gst_price/product_count)
		display_details(per_unit_gst_of_product,overall_price)
	end
end
number_of_product = gets.chomp.to_i
while number_of_product != 0
	array_commodity_data = gets.chomp.split(",")   #String 1 to take input of commodity
	array_commodity_price = gets.chomp.split(",").map{|e| e.to_i}  #String 2  to take input of prices
	if (array_commodity_price.length == array_commodity_data.length)	
		calculate_gst_and_overall_price(array_commodity_data,array_commodity_price)
	else
		p "Invalid Data Entry"
	end
	number_of_product = number_of_product-1
end