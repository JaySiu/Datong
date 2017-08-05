class PagesController < ApplicationController

  def home
    render 'pages/home'
  end

  def about_us
    render 'pages/about_us'
  end

  def people
    render 'pages/people'
  end

  # def events
    # render 'pages/events'
  # end

  def contact_us
    render 'pages/contact_us'
  end

end
