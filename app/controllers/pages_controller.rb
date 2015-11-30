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
    @newsletter_subscription = NewsletterSubscription.new
    render 'teaser', layout: 'public'
  end
  
  def subscribe_newsletter
    @email = params[:newsletter_subscription][:email]
    @newsletter_subscription = NewsletterSubscription.new
    @newsletter_subscription.email= @email
    if @newsletter_subscription.save 
      render 'newsletter', layout: 'public'
    else 
      render 'teaser', layout: 'public'
    end
  end

end
