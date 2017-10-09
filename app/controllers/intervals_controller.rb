require 'csv'
class IntervalsController < ApplicationController
	protect_from_forgery except: :create
	def create
		file = params[:file]
		file_path = file.path
		result = 0
		max = 0
		count_rows = 0
		CSV.foreach(file_path) do |row|
			count_rows += 1
		end
		for i in 0..(count_rows - 30)
			check = i
			CSV.foreach(file_path) do |row|	
				if $LINE_NUMBER > check 
					result += row[0].to_f
				end
				if check - 30 == i
					break
				end
				check += 1
					
			end
			if check == 30
				max == result
			else check
				if max < result
					max =result
				end
			end
		end
	end	
end
