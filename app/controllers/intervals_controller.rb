require 'csv'
class IntervalsController < ApplicationController
	protect_from_forgery except: :create
        def create
                file = params[:file]
                file_path = file.path
		max = 0
		num = 0
		num_of_rows = 0
		max = 0
		arr = Array.new(30)
		CSV.foreach(file_path) do |row|
			num_of_rows += 1
		end
		until (num+30) > num_of_rows
			result = 0
               		CSV.foreach(file_path).with_index(0) do |row,which_row|
				arr[which_row] = row[0].to_f
			end
			arr.drop(num).each.with_index(0) do |a,num_row|
				if num+29 == num_row
					break
				end
				result += a
			end
			if max < result
				max = result.to_f
			end
			num += 1
        	end
		max = max.ceil
        	render plain: "%.2f"%max
	end
end
