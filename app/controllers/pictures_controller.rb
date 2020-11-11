class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :show, :edit, :update, :destroy]
  def index
    @pictures = Picture.all.order(id: "DESC")
    @users = User.all
  end
  def new
    @picture = Picture.new
  end
  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      respond_to do |format|
        if @picture.save
          PictureMailer.picture_mail(@picture).deliver
          format.html { redirect_to pictures_path, notice: '投稿しました' }
          format.json { render :show, status: :created, location: @picture }
        else
          format.html { render :new }
          format.json { render json: @picture.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  def edit
  end
  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "投稿を編集しました"
    else
      render :edit
    end
  end
  def destroy
    @picture.delete
    redirect_to pictures_path, notice: '投稿を削除しました'
  end
  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end
  def show
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
