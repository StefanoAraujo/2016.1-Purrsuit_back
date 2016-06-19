class UsersController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  def all
		respond_to do |format|
			format.html {@user = User.where(["nickname LIKE ?", "%#{params[:search]}%"])}
			format.json {render json: User.all}
		end
  end

  def ranking
    @users = User.all
    ranking = @users.sort_by do |user|
      -user[:experience_points]
    end
    result = []
    ranking[0..9].each do |user|
      result << user
    end
    render json: result
  end

  def show
    id_user = params[:id]
        users = User.where(id: id_user)
        @user = nil
        if (users.length > 0)
          @user = users.first
        else
          raise "ERROR: No user to be shown"
        end
          render json: @user
  end

  def new
    @user = User.new
    render :nothing =>true
  end

  def create
    #puts get_params
    @user = User.new(user_params)
    saved = @user.save
    begin
      if saved
        session[:user_id] = @user.id
        render json: @user
      else
        render :nothing=>true
        raise "sign up failed"
      end
    rescue RuntimeError => error_signup
      puts "#{error_signup}"
    end

    #render json: User.new
  end

  def edit
    id_users = params[:id]
    user = nil
    users = User.where(id: id_users)
      @user = users.first
      render :edit
  end

  def update
    user_id = params[:id]
    users = User.where(id: user_id)
    @user = users.first
    @user.update(user_update_params)
    respond_to do |format|
      format.html {redirect_to :users_all}
      format.json {render json: @user}
    end
  end

  def delete
    user_id = params[:id]
    user = User.find_by(id: user_id)
    puts "#{user}"
      if user
        user.delete
				redirect_to :users_all
      end
  end

  def follow_deputy
    deputy_id = params[:deputyId]
    user_id = params[:userId]
    user = User.find_by(id: user_id)
    deputy = Deputy.find_by(id: deputy_id)
    user.follow(deputy)
    render :nothing => true
  end

  def unfollow_deputy
    deputy_id = params[:deputyId]
    user_id = params[:userId]
    user = User.find_by(id: user_id)
    deputy = Deputy.find_by(id: deputy_id)
    user.unfollow(deputy)
    render :nothing => true
  end

  def ionic_login
    @user = User.find_by(email: params[:email])
    begin
      if @user && @user.authenticate(params[:password])
        render json: @user
      else
        raise "login failed!"
      end
    rescue RuntimeError => error_login
      puts "#{error_login}"
      redirect_to 'login'
    end
  end

  def receive_quests
    user = User.find_by(id: params[:userId])
    questsAmount = params[:questsAmount]

    if user.challengers.length < 3
      allQuests = []
      Quest.all.each do |quest|
        allQuests << quest if !user.doing?(quest) || !user.quests.include?(quest)
      end

      questsAmount.times do
        random = allQuests.sample
        user.receive_quest(random)
        allQuests.delete(random)
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
    end

    def user_update_params
      params.require(:user).permit(:name, :nickname, :email, :password, :gender, :age, :level_id, :uf_id)
    end
end
