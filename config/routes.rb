Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  defaults format: :json do

    root 'links#show_domains'

    # visited_links
    post '/visited_links/', to: 'links#add'
    # visited_domains
    get '/visited_domains/', to: 'links#show_domains'
  end

end
