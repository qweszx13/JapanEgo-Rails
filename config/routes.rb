Rails.application.routes.draw do
  namespace 'japanego' do
    namespace 'v1' do
      resources :word
      resources :member
      resources :authorities
      resources :word_wordbank_relation
      resources :wordbank
    end
  end
end
