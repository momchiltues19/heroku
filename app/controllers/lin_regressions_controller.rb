require 'csv'
require 'linear-regression/linear'
class LinRegressionsController < ApplicationController
	protect_from_forgery except: :create	
	def create
		file = params[:file]
		file_path = file.path
		x, y = [], []
		result = 0
		count = 0
		CSV.foreach(file_path).with_index(0) do |row,line_count|
			x[i] = line_count
			y[i] = row[0].to_f
			count += 1 		
		end
		result = Regression::Linear.new x, y
		render plain: "%.6f,%.6f"% [result.slope, result.intercept] 
	end
end
