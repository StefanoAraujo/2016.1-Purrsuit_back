class UfController < ApplicationController

  def all
    render json: Uf.all
  end

  def show
    render json: Uf.find(params[:id])
  end

  def new
    @uf = Uf.new
  end

  def create
    @uf = Uf.new(uf_params)
    if @uf.save
      redirect_to :ufs_all
		else
			render 'new'
    end
  end

  def edit

    @uf = Uf.find(params[:id])
    render 'edit'

  end

  def update
    @uf = Uf.find(params[:id])

    if @uf.update(uf_params)
      redirect_to :ufs_all
    else
      render 'edit'
    end
  end

  def delete
    id_uf = params[:id]
    ufs = Uf.where(id: id_uf)
    uf = ufs.first
    redirect_to :ufs_all
  end

  private

  def uf_params
    params.require(:uf).permit(:name, :initials)
  end
end


