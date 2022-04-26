Rails.application.routes.draw do
    namespace :api do
        namespace :users do

            post    :signup,    to: "users#create"
            get     :info,      to: "users#show"
            post    :signin,    to: "sessions#create"
            delete  :signout,   to: "sessions#destroy"
        end
    end
end
