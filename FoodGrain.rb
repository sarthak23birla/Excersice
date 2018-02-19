class FoodGrain
	@@gstRate = 0
	@@items = Array.new
	@@varietyOfItem = 0
	def items 
		@@items
	end
	def initialize()
		@@varietyOfItem += 1
	end
	def addItem(items)
		for i in items
			@@items.push(i)
		end
	end
	def updateGST(newGst)
		@@gstRate = newGst
	end
end