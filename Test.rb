require_relative 'Furniture'
require_relative 'Electronics'
require_relative 'FoodGrain'
require_relative 'Cosmetics'
def intializeData()
	food_grain = FoodGrain.new
	food_grain.addItem(["rice","wheat"])
	furniture = Furniture.new
	furniture.addItem(["table","sofa","chair"])
	electronics = Electronics.new
	electronics.addItem(["mobile","tv","tablet"])
	cosmetics = Cosmetics.new
	cosmetics.addItem(["beauty_product","cream","perfume"])
	return food_grain,furniture,electronics,cosmetics
end

def gst_slab_checking(food_grains,furniture,electronics,cosmetics,product)
	return 0    if food_grains.items.include?(product)
	return 0.05 if furniture.items.include?(product)
	return 0.18 if electronics.items.include?(product)
	return 0.28 if cosmetics.items.include?(product)
	return nil
end

def gst_calculate(commodity_price,commodity_data,food_grain,furniture,electronics,cosmetics)
	overall_price = 0
	for _index in (0...commodity_data.length)
		product_count,product = commodity_data[_index].split(" ");intial_price = commodity_price[_index]*product_count.to_i 
		gst_percentage = gst_slab_checking(food_grain,furniture,electronics,cosmetics,product)
		if(gst_percentage.nil?)
			p "Item Doesnot Exsist"
			break
		end
		overall_price += intial_price + (intial_price*gst_percentage)
		p "The GST amount per unit is: #{gst_percentage*intial_price / product_count.to_i}"
	end
	p "The overall price is #{overall_price}"
end

def gst_calculator(commodity_price,commodity_data)
	food_grain,furniture,electronics,cosmetics = intializeData()
	if(commodity_data.length == commodity_price.length)
		gst_calculate(commodity_price,commodity_data,food_grain,furniture,electronics,cosmetics)
	end
end

number_of_item = gets.chomp.to_i
while number_of_item != 0
	commodity_data = gets.chomp.split(",")
	commodity_price = gets.chomp.split(",").map{|e| e.to_i}
	gst_calculator(commodity_price,commodity_data)
	number_of_item = number_of_item - 1
end