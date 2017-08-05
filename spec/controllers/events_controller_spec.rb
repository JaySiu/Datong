require 'rails_helper'
require 'spec_helper'

describe 'EventsController', type: :controller do
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

  after :all do
    User.all.map{ |user| user.destroy }
  end

  before :each do
    @controller = EventsController.new
  end

  describe '#index' do
    it 'assigns @events' do
      sign_in(@event_admin)
      event = Event.create(title: 'Valid title', end_time: 1.day.ago)
      future_event = Event.create(title: 'Future', end_time: Time.now + 1.day)
      get :index
      expect(assigns(:old_events)).to eq([event])
      expect(assigns(:upcoming_events)).to eq([future_event])
    end

    it 'properly renders' do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end

    it '@event_admin is false if not a event admin' do
      sign_in(@normal_user)
      get :index
      expect(assigns(:event_admin)).to be(false)
    end
    it '@event_admin is true if an event admin' do
      sign_in(@event_admin)
      get :index
      expect(assigns(:event_admin)).to be(true)
    end
  end

  describe '#new' do
    it 'assigns a new Event to @event' do
      sign_in(@event_admin)
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end

    it 'redirects if no permissions' do
      get :new
      expect(response).to have_http_status(:redirect)
    end
  end

  describe '#create' do
    it 'redirects to event' do
      sign_in(@event_admin)
      post :create, event: { title: 'saved event', end_time: Time.now }
      expect(response).to redirect_to(event_url(Event.last))

    end

    it 'renders new page on failed save' do
      sign_in(@event_admin)
      post :create, event: FactoryGirl.attributes_for(:event, title: nil)
      expect(response).to render_template(:new)
    end
  end

  describe '#edit' do
    before :each do
      sign_in(@event_admin)
      @event = Event.create(title: 'event title')
      get :edit, id: @event.id
    end
    it 'properly renders' do
      expect(response).to render_template(:edit)
    end
  end

  describe '#update' do
    before :each do
      sign_in(@event_admin)
      @event = FactoryGirl.create(:event, title: 'current title')
    end
    context 'valid attributes' do
      before :each do
        put :update, id: @event, event: FactoryGirl.attributes_for(:event, title: 'new title')
      end
      it 'locates the requested event' do
        assigns(:event).should eq(@event)
      end
      it 'should update the event' do
        @event.reload
        @event.title.should eq('new title')
      end
      it 'should redirect to show event' do
        expect(response).to redirect_to(Event.last)
      end
    end
    context 'invalid attributes' do
      before :each do
        put :update, id: @event, event: FactoryGirl.attributes_for(:event, title: nil)
      end
      it 'locates the requested event' do
        assigns(:event).should eq(@event)
      end
      it 'should not update the event title' do
        @event.reload
        @event.title.should_not be_nil
        @event.title.should eq('current title')
      end
      it 'should render edit' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#destroy' do
    before :each do
      sign_in(@event_admin)
      @event = FactoryGirl.create(:event, title: 'current title')
    end
    it 'should no longer exist' do
      expect {
        delete :destroy, id: @event
      }.to change(Event, :count).by(-1)
    end
    it 'should redirect to events index' do
      delete :destroy, id: @event
      expect(response).to redirect_to(events_url)
    end
  end

end
