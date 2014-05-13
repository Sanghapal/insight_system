BatchManagementSystem::Application.routes.draw do

  resources :requests


#  devise_for :users

  #devise_for :users

devise_for :users, :path_names => {
    :sign_in => 'login',
    :sign_out => 'logout',
    :controller => {:invitations => 'devise/invitations'},
    :root_path => 'home#index'    
  }
  
  resources :questions
#devise_for :users, :path_names => {:sign_in => 'login', 
#              :sign_out => 'logout',    
	      #:password => 'secret',    
	#      :confirmation => 'verification', 
	 #     :root_path => 'home#index'  
	#      } 
match '/:question_id/option' => 'questions#option', :via =>[:get, :post], as: :option
  resources :trainers do
    collection do
      delete 'destroy_multiple'
    end
  end
match '/studentinfo' => 'enquiries#studentinfo', via: :get
resources :enquiries do
    collection do
      delete 'destroy_multiple'
    end
  end
match '/welcome' => 'home#welcome', :via => :get, as: :welcome

    match'/grades/:grade_id/fees' => 'grades#fees', via: :get, as: :fees
    resources :sponsors do
    collection do
      delete 'destroy_multiple'
    end
  end

   #resources :grades do
    #collection do
      #delete 'multipledelete'
      match'/:grade_id/subjects/update_multiple' => 'grades#update_multiple', :via =>[:get, :put ], as: :update_multiple
    #end
   #resources :batches do
    #collection do
     #delete 'multipledelete'
    #end
  #end
#end
#map.resources :grades, :shallow => true do |grade|
#delete 'multipledelete'
  #grade.resources :batches do |batch|
  #delete 'multipledelete'
    #batch.resources :reports
  #end
#end 
  resources :grades, :shallow => true do
collection do
     delete 'multipledelete'
end
    resources :batches do
collection do
     delete 'multipledelete'
end
      resources :lectures
    end
      resources :exams

  end
    #resources :batches do
        #resources :reports
  #end
 resources :subjects do
   collection do
     delete 'destroy_multiple'
   end
 end

  resources :states do
    collection do
      delete 'destroy_multiple'
    end
  end

  resources :cities do
    collection do
      delete 'destroy_multiple'
    end
  end

  resources :students do
    collection do
      delete 'destroy_multiple'
#      put 'ban_multiple'
       post 'assign_batch_multiple'
    end
  end

  match'/students/:student_id/banmultiple' => 'students#banmultiple', :via => [:get, :put], as: :banmultiple
  match '/index_action' => 'students#index_action', :via => :get
  match '/grades/:grade_id/batches' => 'batches#index' 
  match'/students/:student_id/addmition' => 'students#addmition', :via => [:get, :post], as: :addmition

  match '/assign_batch' => 'students#assign_batch', :via => [:get, :post]
  match '/addgrade' => 'students#addgrade', :via => [:get, :post], as: :addgrade
  match '/student/:state_id/city' => 'students#city', :via => :get, as: :city
  match '/students/:grade_id/assign_batch_multiple' => 'students#assign_batch_multiple', :via => [:get, :post], as: :assign_batch_multiple
  match '/grade/:grade_id/subjects' => 'grades#subjects_list', :via => [:get, :post], as: :subjects_list
  match '/grade/:grade_id/batch/:batch_id/students' => 'batches#assignbatch', :via => [:get, :post], as: :assignbatch
    match '/:student_id/document' => 'students#document', via: :get
  match '/batch/:batch_id/assigntrainers' => 'batches#assigntrainers', :via => [:get, :post], as: :assigntrainers
  match '/exam/:exam_id/setpaper' => 'exams#setpaper', :via => [:get, :post], as: :setpaper
  match '/exam/:exam_id/setsubject' => 'exams#setsubject', :via => [:get, :post], as: :setsubject
 match '/exam/:exam_id/setting' => 'exams#setting', :via => [:get, :put], as: :setting
 match '/exam/:exam_id/currentpaper' => 'exams#currentpaper', :via => [:get, :put], as: :currentpaper
 match '/exam/:exam_id/giveexam' => 'exams#giveexam', :via => [:get, :post], as: :giveexam
  match '/result_id/result' => 'exams#result', :via => :get, as: :result
  match '/student/:student_id/allresults' => 'students#allresults', :via => :get, as: :allresults




  match '/grades/batch/:batch_id/attendents' => 'batches#attendents', :via => [:get, :post], as: :attendents

  match'/marking_pattens/:marking_patten_id' => 'grades#destroy_marking_patten', :via => :delete, as: :destroy_marking_patten
  match '/studentinfo' => 'enquiries#studentinfo', via: :get
  match'/grade/:grade_id/subjects/update_multiple' => 'grades#update_multiple', :via =>[:get, :put ], as: :update_multiple
  match'/enquiry/:enquiry_id/students/new' => 'students#enrollement', :via => :get, as: :enrollement

# match '/trainer/ability' => 'trainers#ability', :via => :post, as: :ability

match '/trainers/:trainer_id/ability' => 'trainers#ability', :via => [:get, :post], as: :ability
match 'trainers/:trainer_id/display' => 'trainers#display', :via =>  :get, as: :display
match 'lectures/:lecture_id/details' => 'lectures#details', :via =>  :get, as: :details
match '/calenderhelp' => 'home#calenderhelp', :via => :get
#match 'exams/:exam_id/details' => 'exams#details', :via =>  :get, as: :details


  # The priority is based upon order of creation:
  # first created -> highest priority.
root :to => 'home#index'
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

