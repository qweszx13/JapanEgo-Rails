Rails.application.routes.draw do
  namespace 'japanego' do
    namespace 'v1' do
      resources :word
    end
  end
end
