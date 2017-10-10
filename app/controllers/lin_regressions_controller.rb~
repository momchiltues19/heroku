require 'csv'
require 'regres.rb'

class LinRegressionsController < ApplicationController
  protect_from_forgery except: :create

  def create
    x , y  = [], []
    CSV.foreach(params[:file].path).with_index do |line, index|
      x.push(index)
      y.push(line[0].to_f)
    end

    result = SimpleLinearRegression.new(x, y)

    render plain: '%.6f, %.6f' % [result.slope, result.y_intercept]
  end
end
