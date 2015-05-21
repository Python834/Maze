############################################################
#
#  Name:        Patrick McManis
#  Assignment:  Maze
#  Date:        6/10/2014
#  Class        CIS 283
#  Description: Creates a maze solving program
#
############################################################

class Maze
	def initialize(filename)
		if File.exist?("#{filename}.mz")
			@mz = []
			maze = File.open("#{filename}.mz", 'r')
			while !maze.eof?
				row = maze.gets.split('')
				@mz << row
			end
			maze.close
		else
			puts 'Maze not found!'
		end
	end

	def solve
		row = 0
		while row < @mz.length
			col = 0
			while col < @mz[row].length
				if @mz[row][col] == 'F'
					@f_row = row
					@f_col = col
				end
				col += 1
			end
			row += 1
		end

		if @mz[@f_row+1][@f_col] == ' '
			@mz[@f_row+1][@f_col] = 0
		end

		if @mz[@f_row-1][@f_col] == ' '
			@mz[@f_row-1][@f_col] = 0
		end

		if @mz[@f_row][@f_col+1] == ' '
			@mz[@f_row][@f_col+1] = 0
		end

		if @mz[@f_row][@f_col-1] == ' '
			@mz[@f_row][@f_col-1] = 0
		end
		$total = 0
		@count = 0
		found_s = false
		@change = true
		while found_s == false && @change == true
			@change = false
			row = 0
			while row < @mz.length
				col = 0
				while col < @mz[row].length

					#South
					if row+1 < @mz.length
						if @mz[row][col] == @count
							if @mz[row+1][col] == ' '
								@mz[row+1][col] = @count + 1
								@change = true
							elsif @mz[row+1][col] == 'S'
								@change = true
								@s_row = row+1
								@s_col = col
								found_s = true
							end
						end
					end


					# East
					if col+1 < @mz[row].length
						if @mz[row][col] == @count
							if @mz[row][col+1] == ' '
								@mz[row][col+1] = @count + 1
								@change = true
							elsif @mz[row][col+1] == 'S'
								@change = true
								@s_row = row
								@s_col = col+1
								found_s = true
							end
						end
					end

					#North
					if row-1 > 0
						if @mz[row][col] == @count
							if @mz[row-1][col] == ' '
								@mz[row-1][col] = @count + 1
								@change = true
							elsif @mz[row-1][col] == 'S'
								@change = true
								@s_row = row-1
								@s_col = col
								found_s = true
							end
						end
					end

					#West
					if col-1 > 0
						if @mz[row][col] == @count
							if @mz[row][col-1] == ' '
								@mz[row][col-1] = @count + 1
								@change = true
							elsif @mz[row][col-1] == 'S'
								@change = true
								@s_row = row
								@s_col = col-1
								found_s = true
							end
						end
					end
					col += 1
				end
				row += 1
			end
			$total += 1
			@count += 1
		end

		if @change == true
			while @count >= 0

				# South
				if @mz[@s_row+1][@s_col] == @count
					@mz[@s_row+1][@s_col] = '*'
					@s_row = @s_row+1
					@s_col = @s_col
				end

				# East
				if @mz[@s_row][@s_col+1] == @count
					@mz[@s_row][@s_col+1] = '*'
					@s_row = @s_row
					@s_col = @s_col+1
				end

				# North
				if @mz[@s_row-1][@s_col] == @count
					@mz[@s_row-1][@s_col] = '*'
					@s_row = @s_row-1
					@s_col = @s_col
				end

				# West
				if @mz[@s_row][@s_col-1] == @count
					@mz[@s_row][@s_col-1] = '*'
					@s_row = @s_row
					@s_col = @s_col-1
				end

				@count -= 1
			end
		else
			puts 'Maze cannot be solved.'
		end
		row = 0
		while row < @mz.length
			col = 0
			while col < @mz[row].length

				if @mz[row][col].is_a?(Fixnum)
					@mz[row][col] = ' '
				end

				col += 1
			end
			row += 1
		end
		@count += 1
	end



	def maze_print
		@mz.each do |row|
			puts row.join()
		end
	end
end

input = 0
while input != 11
	puts '1) Load maze 1'
	puts '2) Load maze 2'
	puts '3) Load maze 3'
	puts '4) Load maze 4'
	puts '5) Load maze 5'
	puts '6) Load maze 6'
	puts '7) Load maze 7'
	puts '8) Load maze 8'
	puts '9) Load maze 9'
	puts '10) Load maze 10'
	puts '11) Quit'
	print 'Choose a maze: '
	input = gets.to_i
	puts
	
	if input == 1
		maze = Maze.new('maze1')
		maze.maze_print
		maze.solve
		maze.maze_print
		puts "Maze took #{$total} to complete"
		puts

	elsif input == 2
		maze = Maze.new('maze2')
		maze.maze_print
		maze.solve
		maze.maze_print
		puts "Maze took #{$total} to complete"
		puts
	
	elsif input == 3
		maze = Maze.new('maze3')
		maze.maze_print
		maze.solve
		maze.maze_print
		puts "Maze took #{$total} to complete"
		puts
	
	elsif input == 4
		maze = Maze.new('maze4')
		maze.maze_print
		maze.maze_print
		maze.solve
		
		puts
	
	elsif input == 5
		maze = Maze.new('maze5')
		maze.maze_print
		maze.solve
		maze.maze_print
		puts "Maze took #{$total} to complete"
		puts
	
	elsif input == 6
		maze = Maze.new('maze6')
		maze.maze_print
		maze.solve
		maze.maze_print
		puts "Maze took #{$total} to complete"
		puts
	
	elsif input == 7
		maze = Maze.new('maze7')
		maze.maze_print
		maze.solve
		maze.maze_print
		puts "Maze took #{$total} to complete"
		puts
	
	elsif input == 8
		maze = Maze.new('maze8')
		maze.maze_print
		maze.solve
		maze.maze_print
		puts "Maze took #{$total} to complete"
		puts
	
	elsif input == 9
		maze = Maze.new('maze9')
		maze.maze_print
		maze.solve
		maze.maze_print
		puts "Maze took #{$total} to complete"
		puts
	
	elsif input == 10
		maze = Maze.new('maze10')
		maze.maze_print
		maze.solve
		maze.maze_print
		puts "Maze took #{$total} to complete"
		puts
	
	elsif input == 11
		puts 'Goodbye...'
	else
		puts 'Enter valid menu option.'
	end

end