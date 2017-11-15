class Admin::LinesController < ApplicationController

  def update
    @line = Line.find(params[:id])
    @line.update(line_params)
    flash[:notice] = 'Product attributes updated successfully!'
    redirect_to root_path
  end

  private

  def line_params
    params.require(:line).permit(:price, :size)
  end

end
