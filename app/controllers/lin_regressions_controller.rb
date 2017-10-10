require 'csv'
require 'linear-regression/linear'
class LinRegressionsController < ApplicationController
	protect_from_forgery except: :create	
	def create
		file = params[:file]
		file_path = file.path
		xs = []
		ys = []
		result = 0
		i = 0
		CSV.foreach(file_path).with_index(0) do |row,which_row|
			xs[i] = which_row
			ys[i] = row[0].to_f
			i += 1 		
		end
		result = Regression::Linear.new xs, ys
		render plain: "%.6f,%.6f"% [result.slope, result.intercept] 
	end
end
