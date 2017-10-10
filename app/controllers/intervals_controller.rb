require 'csv'
class IntervalsController < ApplicationController
	protect_from_forgery except: :create
        def create
                file = params[:file]
                file_path = file.path
		max = 0
		check = 0
		num_of_rows = 0
		CSV.foreach(file_path) do |row|
			num_of_rows += 1
		end
		until (check+30)==num_of_rows
			result = 0
               		CSV.foreach(file_path).with_index(0) do |row,which_row|
				if check+29 == which_row
					break
				end
				result += row[0].to_f
			end
			if max < result
				max = result.to_f
			end
			check += 1
               	end
                max = max.ceil
                render plain: "%.2f"%max
        end

end
