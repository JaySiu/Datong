class ResourcesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_core_member!, except: [ :index]

  def authenticate_core_member!
    if current_user.nil? or !current_user.is_core_member
      flash[:notice] = 'You do not have access to this page.'
      redirect_to resources_path
    end
  end

  def index
    @core_member = false
    if !current_user.nil? and current_user.is_core_member
      @core_member = true
    end
    #debugger
    @resources = Resource.all
    render "index"
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    
    if @resource.save
      flash[:notice] = "The resource #{@resource.title} has been uploaded."
      redirect_to resources_path#, notice: 
    else
      render "new"
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    flash[:notice] = "The resource #{@resource.title} has been deleted."
    redirect_to resources_path#, notice: "The resource #{@resource.name} has been deleted."
  end
  
  private
  
  def resource_params
    params.require(:resource).permit(:title, :attachment)
  end

end
