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
    @event_admins = User.where(is_event_admin: true).to_a
    @account_admins = User.where(is_account_admin: true).to_a
  end

  def edit_multiple
    @users = User.order('email asc').all
  end

  def update_multiple
    @core_members = params[:user_ids]
    reset_is_core_member
    if !@core_members.nil? && !@core_members.empty?
      set_is_core_member(@core_members)
    end
    flash[:success] = 'Success! Core members updated.'
    redirect_to core_members_index_path
  end
end