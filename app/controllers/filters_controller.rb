
require 'csv'
class FiltersController < ApplicationController
	protect_from_forgery except: :create
	def create
		file = params[:file]
                file_path = file.path
                result = 0
                CSV.foreach(file_path) do |row|
			if row[2].to_f%2 != 0
				result += row[1].to_f
			end
                end
                result = result.ceil
                render plain: "%.2f"%result		
	end
end
