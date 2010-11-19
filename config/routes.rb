Rails.application.routes.draw do

  namespace(:admin_data) do
    match '/' => "main#index", :as => :index
    match '/feed/:klasss' => "feed#index", :defaults => { :format =>'rss' }, :as => :feed
  end

  scope '/admin_data' do
    match '/klass/:klass/table_structure' => "admin_data/main#table_structure", :as => :table_structure_admin_data, :via => :get

    match '/klass/(:klass)' => "admin_data/main#index",       :as => :admin_data_index, :via => :get
    match '/klass/(:klass)' => "admin_data/main#create",      :as => :admin_data_index, :via => :post

    match '/klass/:klass/new' => "admin_data/main#new",       :as => :new_admin_data, :via => :get
    match '/klass/:klass/:id/del' => "admin_data/main#del",   :as => :del_admin_data, :via => :delete
    match '/klass/:klass/:id/edit' => "admin_data/main#edit", :as => :edit_admin_data, :via => :get
    match '/klass/:klass/:id' => "admin_data/main#show",      :as => :admin_data, :via => :get
    match '/klass/:klass/:id' => "admin_data/main#update",    :as => :admin_data, :via => :put
    match '/klass/:klass/:id' => "admin_data/main#destroy",   :as => :admin_data, :via => :delete
  end

  scope "admin_data", :module => :admin_data, :as => 'admin_data' do

    controller "migration" do
      match '/migration', :to => :index,  :as => :migration_information
      match '/jstest',    :to => :jstest, :as => :jstest
    end

    match '/quick_search/:klass' => "search#quick_search", :as => :search
    match '/advance_search/:klass' => "search#advance_search", :as => :advance_search
    match '/public/*file' => "public#serve"

  end

end
