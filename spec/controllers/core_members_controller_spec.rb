require 'rails_helper'
require 'spec_helper'

describe CoreMembersController, type: :controller do
  render_views

  before :all do
    @normal_user = User.find_by(email: 'normal@user.com')
    @core = User.find_by(email: 'core@member.com')
    @event_admin = User.find_by(email: 'event@admin.com')
    @account_admin = User.find_by(email: 'account@admin.com')

    @normal_user ||= FactoryGirl.create(
        :user,
        email: 'normal@user.com',
        fname: 'normal',
        lname: 'user',
        confirmed_at: Time.now,
        is_core_member: false,
        is_event_admin: false,
        is_account_admin: false
    )

    @core ||= FactoryGirl.create(
        :user,
        email: 'core@member.com',
        fname: 'core',
        lname: 'member',
        confirmed_at: Time.now,
        is_core_member: true,
        is_event_admin: false,
        is_account_admin: false
    )

    @event_admin ||= FactoryGirl.create(
        :user,
        email: 'event@admin.com',
        fname: 'event',
        lname: 'admin',
        confirmed_at: Time.now,
        is_core_member: false,
        is_event_admin: true,
        is_account_admin: false
    )

    @account_admin ||= FactoryGirl.create(
        :user,
        email: 'account@admin.com',
        fname: 'account',
        lname: 'admin',
        confirmed_at: Time.now,
        is_core_member: false,
        is_event_admin: false,
        is_account_admin: true
    )
  end

  after :all do
    User.all.map{ |user| user.destroy }
  end


  before :each do
    @controller = CoreMembersController.new
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit_multiple" do
    it "returns http success" do
      sign_in(@account_admin)

      get :edit_multiple
      expect(response).to have_http_status(:success)
    end
    it "lists all users" do
      sign_in(@account_admin)

      get :edit_multiple
      expect(assigns(:users).sort).to eq(User.all)
    end

    it "redirects if no permission" do
      get :edit_multiple
      expect(response).to have_http_status(:redirect)
    end

  end

  describe "PUT #update_multiple" do
    before :each do
      @user1 = User.create(email: 'user1@datong.com', password: 'password', fname: 'user1', lname: 'test')
      @user2 = User.create(email: 'user2@datong.com', password: 'passwordpassword', fname: 'user2', lname: 'test')
    end
    it "assigns core_members" do
      sign_in(@account_admin)
      put :update_multiple, :core_mem => [@user1.id]
      assigns(:core_members).should eq(["#{@user1.id}"])
      @user1.reload
      @user1.is_core_member.should be_truthy
      @user2.reload
      @user2.is_core_member.should be_falsey
    end
    it "correctly updates one user" do
      sign_in(@account_admin)

      put :update_multiple, :core_mem => [@user1.id]
      @user1.reload
      @user1.is_core_member.should be_truthy
      @user2.reload
      @user2.is_core_member.should be_falsey
    end
    it "correctly updates unchecks" do
      sign_in(@account_admin)

      put :update_multiple, :core_mem => [@user1.id]
      @user1.reload
      @user1.is_core_member.should be_truthy
      @user2.reload
      @user2.is_core_member.should be_falsey
      put :update_multiple, :core_mem => []
      @user1.reload
      @user1.is_core_member.should be_falsey
      @user2.reload
      @user2.is_core_member.should be_falsey
    end
    it "redirects to index" do
      sign_in(@account_admin)

      put :update_multiple, :core_mem => [@user2.id]
      expect(response).to redirect_to(core_members_index_path)
    end
  end
end
