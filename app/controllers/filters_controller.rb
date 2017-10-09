require 'csv'
class FiltersController < ApplicationController
	protect_from_forgery except: :create
	def create
		file = params[:file]
                file_path = file.path
                sum = 0
                CSV.foreach(file_path) do |row|
			if row[2].to_f%2 != 0
				sum += row[1].to_f
			end
                end
                sum = sum.ceil
                render plain: "%.2f"%sum		
	end
end
