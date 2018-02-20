def north(x_coordinate,y_coordinate,max_allowed_distance)
	possible_moves = Array.new
	for value in (0..max_allowed_distance)
		if (y_coordinate + value) < 8
			possible_moves.push([x_coordinate,y_coordinate+value].join(""))
		end
	end
	if possible_moves.nil?
		return []
	end
	return possible_moves
end

def north_east(x_coordinate,y_coordinate,max_allowed_distance)
	possible_moves = Array.new
	for value in (0..max_allowed_distance)
		if((y_coordinate + value) < 8) && (( x_coordinate.ord - 65 + value) < 8)
			possible_moves.push([(x_coordinate.ord+value).chr,(y_coordinate+value)].join(""))
		end
	end
	if possible_moves.nil?
		return []
	end
	return possible_moves
end

def east(x_coordinate,y_coordinate,max_allowed_distance)
	possible_moves = Array.new
	for value in (0..max_allowed_distance)
		if (x_coordinate.ord-65 + value) < 8
			possible_moves.push([(x_coordinate.ord+value).chr,(y_coordinate)].join(""))
		end
	end
	if possible_moves.nil?
		return []
	end
	return possible_moves
end

def south_east(x_coordinate,y_coordinate,max_allowed_distance)
	possible_moves = Array.new
	for value in (0..max_allowed_distance)
		if((y_coordinate - value) >=0 ) && (( x_coordinate.ord-65+ value) < 8)
			possible_moves.push( [(x_coordinate.ord+value).chr,y_coordinate-value].join(""))
		end
	end
	if possible_moves.nil?
		return []
	end
	return possible_moves
end

def south(x_coordinate,y_coordinate,max_allowed_distance)
	possible_moves = Array.new
	for value in (0..max_allowed_distance)
		if (y_coordinate - value) >= 0
			possible_moves.push([x_coordinate,y_coordinate-value].join(""))
		end
	end
	if possible_moves.nil?
		return []
	end
	return possible_moves
end

def south_west(x_coordinate,y_coordinate,max_allowed_distance)
	possible_moves = Array.new
	for value in (0..max_allowed_distance)
		if((y_coordinate - value) >= 0) && ((x_coordinate.ord-65-value) >= 0 )
			possible_moves.push([(x_coordinate.ord-value).chr,y_coordinate-value].join(""))
		end
	end
	if possible_moves.nil?
		return []
	end
	return possible_moves
end

def west(x_coordinate,y_coordinate,max_allowed_distance)
	possible_moves = Array.new
	for value in (0..max_allowed_distance)
		if (x_coordinate.ord-65- value) >= 0
			possible_moves.push([(x_coordinate.ord-value).chr,y_coordinate].join(""))
		end
	end
	if possible_moves.nil?
		return []
	end
	return possible_moves
end

def north_west(x_coordinate,y_coordinate,max_allowed_distance)
	possible_moves = Array.new
	for value in (0..max_allowed_distance)
		if((y_coordinate + value) <8) && ((x_coordinate.ord-65-value) >= 0 )
			possible_moves.push([(x_coordinate.ord-value).chr,y_coordinate+value].join(""))
		end
	end
	if possible_moves.nil?
		return []
	end
	return possible_moves
end


class Chess
	def initialize(x_coordinate,y_coordinate)
		@x_coordinate = x_coordinate
		@y_coordinate = y_coordinate
	end
end
class King < Chess
	def initalize(x_coordinate,y_coordinate)
		super(x_coordinate,y_coordinate)
	end
	def display_result
		final_array = north(@x_coordinate,@y_coordinate,1)+north_east(@x_coordinate,@y_coordinate,1)+east(@x_coordinate,@y_coordinate,1)+south_east(@x_coordinate,@y_coordinate,1)+south(@x_coordinate,@y_coordinate,1)+south_west(@x_coordinate,@y_coordinate,1)+west(@x_coordinate,@y_coordinate,1)+north_west(@x_coordinate,@y_coordinate,1)
		puts "The Final Result Set is #{final_array.uniq!.join("-")}" 
	end
end

class Queen < Chess
	def initalize(x_coordinate,y_coordinate)
		super(x_coordinate,y_coordinate)
	end
	def display_result
		final_array = north(@x_coordinate,@y_coordinate,7)+north_east(@x_coordinate,@y_coordinate,7)+east(@x_coordinate,@y_coordinate,7)+south_east(@x_coordinate,@y_coordinate,7)+south(@x_coordinate,@y_coordinate,7)+south_west(@x_coordinate,@y_coordinate,7)+west(@x_coordinate,@y_coordinate,7)+north_west(@x_coordinate,@y_coordinate,7)
		puts "The Final Result Set is #{final_array.uniq!.join("-")}" 
	end
end

class Bishop < Chess
	def initalize(x_coordinate,y_coordinate)
		super(x_coordinate,y_coordinate)
	end
	def display_result
		final_array = north_east(@x_coordinate,@y_coordinate,7)+south_east(@x_coordinate,@y_coordinate,7)+south_west(@x_coordinate,@y_coordinate,7)+north_west(@x_coordinate,@y_coordinate,7)
		puts "The Final Result Set is #{final_array.uniq!.join("-")}" 
	end
end

class Rook < Chess
	def initalize(x_coordinate,y_coordinate)
		super(x_coordinate,y_coordinate)
	end
	def display_result
		final_array = north(@x_coordinate,@y_coordinate,7)+east(@x_coordinate,@y_coordinate,7)+south(@x_coordinate,@y_coordinate,7)+west(@x_coordinate,@y_coordinate,7)
		puts "The Final Result Set is #{final_array.uniq!.join("-")}"
	end
end
class Pawn < Chess
	def initalize(x_coordinate,y_coordinate,color)
		super(x_coordinate,y_coordinate)
		@color = color
	end
	def display_result
		if color == "Black"
			final_array = south(@x_coordinate,@y_coordinate,1)
			puts "The Final Result Set is #{final_array.uniq!.join("-")}"
		elsif color == "White"
			final_array = north(@x_coordinate,@y_coordinate,1)
			puts "The Final Result Set is #{final_array..uniq!.join("-")}"
		end
	end
end
class Horse < Chess
	def initialize(x_coordinate,y_coordinate)
		super(x_coordinate,y_coordinate)
	end
	def display_result
		
		

	end
end
position = gets.chomp
x_coordinate,y_coordinate = position.split("")
queen = Queen.new(x_coordinate,y_coordinate.to_i)
queen.display_result
