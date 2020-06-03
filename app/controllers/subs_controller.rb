class SubsController < ApplicationController
#   Review: 
#   # skinny controllers; fat models
#   # Fat models = logic
#   # skinny controllers = action

#   #CRUD actions on typical webpage
#   #Correspond to HTTP verbs: 
# C  CREATE = post
# R  READ = get
# U  UPDATE = put/patch
# D  DESTROY = delete


  
  def index
    @subs = Sub.all
  end

  def show
    @subs = Sub.find(params[:id])
  end

  def new
    @subs = Sub.new
    render partial: 'form'
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_path
    else
      render :new
    end

  end

  def edit
    @sub = Sub.find(params[:id])
    render partial: 'form'

  end

  def update 
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end

def destroy 
  # @sub = Sub.find(params[:id])
  # @sub.destroy
  # redirect_to subs_path

  Sub.find(params[:id]).destroy
  redirect_to subs_path
end


  private
  def sub_params
    params.require(:sub).permit()
  end

end
