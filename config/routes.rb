ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'posts'
  map.resources :users
  map.resource :sessions
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
   map.resources :posts, :has_many => :comments
  map.namespace :admin do |admin|
    admin.resources :posts
    admin.root :controller => 'posts'
  end
end
