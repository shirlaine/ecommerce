class Admin::LinesController < ApplicationController

  def update
    @line = Line.find(params[:id])
    @line.update(line_params)
    flash[:notice] = 'Product attributes updated successfully!'
    redirect_to root_path
  end

  


  private

  def set_line
    @line = Line.find(params[:id])

  def line_params
    params.require(:line).permit(:price, :size, :stock, :sku)
  end

end
