class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_event_admin!, except: [:index, :show]


  def authenticate_event_admin!
    if current_user.nil? or !current_user.is_event_admin
      flash[:notice] = 'You do not have access to this page.'
      redirect_to events_path
    end
  end

  # GET /events
  # GET /events.json
  def index
    @event_admin = false
    if !current_user.nil? and current_user.is_event_admin
      @event_admin = true
    end
    @upcoming_events = Event.where("end_time > ?", Time.now.utc().to_s)
    @old_events = Event.where("end_time <= ?", Time.now.utc().to_s)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    start = @event.start_time.to_s.split(" ")
    ending = @event.end_time.to_s.split(" ")
    @year = start[0].split("-")[0]
    @start_month = start[0].split("-")[1]
    @start_date = start[0].split("-")[2]
    @end_month = ending[0].split("-")[1]
    @end_date = ending[0].split("-")[2]
    time = start[1].split(":")
    @start_time = (time[0]+":"+time[1])
    time = ending[1].split(":")
    @end_time = (time[0]+":"+time[1])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time)
    end
end
