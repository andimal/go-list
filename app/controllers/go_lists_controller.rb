class GoListsController < ApplicationController

  def show
    if user_signed_in?
      @user = User.find( current_user.id )
    end
  end

  def search_yelp
    if params[:term] && params[:location]
      config          = YAML::load(File.open("#{Rails.root}/config/settings.local.yml"))
      api_host        = 'api.yelp.com'

      consumer        = OAuth::Consumer.new(config['yelp']['consumer_key'], config['yelp']['consumer_secret'], {:site => "http://#{api_host}"})
      access_token    = OAuth::AccessToken.new(consumer, config['yelp']['token'], config['yelp']['token_secret'])

      path            = '/v2/search?term=' + params[:term] + '&location=' + params[:location]

      render text: access_token.get(path).body
    
    else
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end
end