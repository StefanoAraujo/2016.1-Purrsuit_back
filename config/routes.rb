Rails.application.routes.draw do

  root to: 'sessions#new'

  get 'users/all' => 'users#all', format: :json, as: :users_all
  get 'users/new' => 'users#new'
  get 'users/receivequests' => 'users#receive_quests', format: :json
  get 'users/ranking/:id' => 'users#ranking_user', format: :json
  get 'users/ranking' => 'users#ranking', format: :json
  post 'users/create' => 'users#create', format: :json
  get 'users/:id' => 'users#show', format: :json
  get 'users/:id/edit' => 'users#edit', format: :json, as: :users_edit
  post 'users/:id/follow_deputy' => 'users#follow_deputy', format: :json
  post 'users/:id/unfollow_deputy' => 'users#unfollow_deputy', format: :json
  post 'users/:id/update' => 'users#update', format: :json, as: :users_update
  delete 'users/delete/:id' => 'users#delete', as: :users_delete

  get 'deputies/all' => 'deputies#all', format: :json
  get 'deputies/new' => 'deputies#new'
  post 'deputies/create' => 'deputies#create', format: :json
  get 'deputies/:id' => 'deputies#show', format: :json
  post 'deputies/update' => 'deputies#update', format: :json
  get 'deputies/search/:toSearch' => 'deputies#search', format: :json
  get 'users/:id/followed_deputies' => 'deputies#followed_deputies', format: :json
  delete 'deputies/:id' => 'deputies#delete', as: :deputies_delete

  get 'achievements/all' => 'achievements#all', format: :json, as: :achievements_all
  get 'achievements/new' => 'achievements#new', format: :json, as: :achievements_new
  post 'achievements/create' => 'achievements#create', as: :achievements
  get 'achievements/:id' => 'achievements#show', format: :json
  get 'achievements/:id/edit' => 'achievements#edit', format: :json, as: :achievements_edit
  post 'achievements/:id/update' => 'achievements#update',as: :achievements_update
	delete 'achievements/:id' => 'achievements#delete', as: :achievements_delete

  get 'quests/all' => 'quests#all', format: :json, as: :quests_all
  get 'quests/doing' => 'quests#received_quests'
	get 'quests/new' => 'quests#new', format: :json, as: :quests_new
	post 'quests/create' => 'quests#create', as: :quests
	get 'quests/:id' => 'quests#show', format: :json
	post 'quests/:id/update' => 'quests#update', format: :json, as: :quests_update
	get 'quests/:id/edit' => 'quests#edit', format: :json, as: :quests_edit
	delete 'quests/:id' => 'quests#delete', as: :quests_delete

	get 'ufs/all' => 'ufs#all', format: :json
	get 'ufs/new' => 'ufs#new'
 	post 'ufs/create' => 'ufs#create', as: :ufs
	get 'ufs/:id' => 'ufs#show', format: :json
	patch 'ufs/:id/update' => 'ufs#update', format: :json, as: :uf
	delete 'ufs/:id' => 'ufs#delete', as: :ufs_delete

	get 'parties/all' => 'parties#all', format: :json
	get 'parties/new' => 'parties#new'
	post 'parties/create' => 'parties#create', as: :parties
	get 'parties/:id' => 'parties#show', format: :json
	patch 'parties/:id/update' => 'parties#update', format: :json, as: :party
	get 'parties/:id/edit' => 'parties#edit'
	delete 'parties/:id' => 'parties#delete', as: :parties_delete

  get 'levels/all' => 'levels#all', format: :json

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'login/signin' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  #ionic login
  get 'signIn' => 'users#ionic_login'
end
