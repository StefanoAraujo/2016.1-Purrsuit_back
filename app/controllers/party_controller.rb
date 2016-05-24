class PartyController < ApplicationController

  def all
    render json: Party.all
  end

  def show
    render json: Party.find(params[:id])
  end

  def new
    @party = Party.new
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
    id_party = params[:id]
    partys = Party.where(id: id_party)
    party = partys.first
    redirect_to :parties_all
  end

  private

  def party_params
    params.require(:party).permit(:name, :initials, :uf_id)
  end
end

