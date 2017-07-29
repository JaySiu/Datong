class CoreMembersController < ApplicationController
  include CoreMembersHelper

  before_filter :authenticate_account_admin!, except: [:index]

  def authenticate_account_admin!
    if current_user.nil? or !current_user.is_account_admin
      flash[:notice] = 'You do not have access to this page.'
      redirect_to core_members_path
    end
  end

  def index
    @is_account_admin = false
    if !current_user.nil? and current_user.is_account_admin
      @is_account_admin = true
    end
    @core_members = User.where(is_core_member: true).to_a
  end

  def edit_multiple
    @users = User.order('email asc').all
  end

  def update_multiple
    @core_members = params[:core_mem]
    @event_admins = params[:event_ad]
    reset_is_core_member
    reset_is_event_admin
    if !@core_members.nil? && !@core_members.empty?
      set_is_core_member(@core_members)
    end
    if !@event_admins.nil? && !@event_admins.empty?
      set_is_event_admin(@event_admins)
    end 
    flash[:success] = 'Success! Member Permissions updated.'
    redirect_to core_members_index_path
  end
end