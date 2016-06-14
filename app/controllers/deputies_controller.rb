class DeputiesController < ApplicationController

  def all
    deputy_order = Deputy.order(:deputy_name)
    render json: deputy_order
  end

  def new
    @deputy = Deputy.new
    render :nothing =>true
  end

  def show
    deputy_id = params[:id]
    selected_deputies = Deputy.where(id: deputy_id)
    @deputy = nil
    if (selected_deputies.length > 0)
      @deputy = selected_deputies.first
    else
      raise "ERROR"
    end
    render json: @deputy
  end

  def search
    deputy_contains = params[:toSearch]

    deputy_contains.strip!
    if deputy_contains.length
      deputies_found = Deputy.where("deputy_name LIKE ?", "%#{deputy_contains}%")
      if deputies_found
        deputies_order = deputies_found.order(:deputy_name)
        render json: deputies_order
      else
        raise "Deputies not found"
      end
    end
  end

  def create
    @deputy = Deputy.new(deputy_params)
    deputy_saved = @deputy.save
      if deputy_saved
        render json: @deputy
      else
        render :nothing=>true
      end
  end

  def update
    deputy_id = params[:id]
    deputies = Deputy.where(id: deputy_id)
    @deputy = deputies.first
    @deputy.update(deputy_params)
    render json: @deputy
  end

  def delete
    deputy_id = params[:id]
    selected_deputies = Deputy.where(id: deputy_id)
    if (selected_deputies.length > 0)
      @deputy = selected_deputies.first
      @deputy.destroy
      redirect_to :deputies_all
    else
      render :nothing => true
    end
  end

  def followed_deputies
    user_id = params[:id]
    user = User.find_by(id: user_id)
    followed_deputies = user.following
    render json: followed_deputies
  end

  private
  def deputy_params
      params.require(:deputy).permit(:name,:deputy_name, :email,:registration,:legislation_situation,:gender,:image_path,  :uf_id, :party_id)
  end
end
