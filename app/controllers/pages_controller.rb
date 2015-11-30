class PagesController < ApplicationController

  def index
    render
  end

  def contact_us
    @contact = Contact.new
  end

  def about
    render
  end

  def teaser
    render 'teaser', layout: 'public'
  end
  
  def subscribe_newsletter
    render 'newsletter', layout: 'public'
  end
end
