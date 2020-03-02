class ChefsController < ApplicationController 

  def new 
    @chef=Chef.new
  end

  def create 
    # debugger
    @chef=Chef.new(chef_params)
    if @chef.save 
      flash[:success]= "Welcome #{@chef.chefname} to MyRecipe App!"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end

  def show 
    @chef=Chef.find(params[:id])
  end

  private 
  def chef_params
    params.require(:chef).permit(:chefname,:email,:password,:password_confirmation)
  end

  
end