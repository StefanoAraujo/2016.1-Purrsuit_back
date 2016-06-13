class PartiesController < ApplicationController

  def all
    render json: Party.all
  end

  def show
    party_id = params[:id]
    selected_parties = Party.where(id: party_id)
    @party = nil
    if (selected_parties.length > 0)
      @party = selected_parties.first
    else
      raise "ERROR"
    end
    render json: @party
  end

  def new
    @party = Party.new
    render :nothing =>true
  end

  def create
    @party = Party.new(party_params)
    if @party.save
      redirect_to :parties_all
		else
			render action: "new"
		end
  end

  def edit
    @party = Party.find(params[:id])
    render 'edit'
  end

  def update
    @party = Party.find(params[:id])

    if @party.update(party_params)
      redirect_to :parties_all
    else
      render 'edit'
    end
  end

  def delete
    party_id = params[:id]
    selected_parties = Party.where(id: party_id)
    if (selected_parties.length > 0)
      @party = selected_parties.first
      @party.destroy
      redirect_to :parties_all
    else
      render :nothing => true
    end
  end

  private

  def party_params
    params.require(:party).permit(:name, :initials, :uf_id)
  end
end
