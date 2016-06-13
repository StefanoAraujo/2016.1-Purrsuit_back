class UfsController < ApplicationController

  def all
    render json: Uf.all
  end

  def show
    uf_id = params[:id]
    selected_ufs = Uf.where(id: uf_id)
    @uf = nil
    if (selected_ufs.length > 0)
      @uf = selected_ufs.first
    else
      raise "ERROR"
    end
    render json: @uf
  end

  def new
    @uf = Uf.new
    render :nothing =>true
  end

  def create
    @uf = Uf.new(uf_params)
    uf_saved = @uf.save
    if uf_saved
      render json: @uf
    else
      render :nothing =>true
    end
  end

  def edit

    @uf = Uf.find(params[:id])
    render 'edit'

  end

  def update
    uf_id = params[:id]
    ufs = Uf.where(id: uf_id)
    @uf = ufs.first
    @uf.update(uf_params)
    render json: @uf
  end

  def delete
    uf_id = params[:id]
    selected_ufs = Uf.where(id: uf_id)
    if (selected_ufs.length > 0)
      @uf = selected_ufs.first
      @uf.destroy
    redirect_to :ufs_all
    else
      render :nothing =>true
    end
  end

  private

  def uf_params
    params.require(:uf).permit(:name, :initials)
  end
end
