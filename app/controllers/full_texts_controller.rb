class FullTextsController < ApplicationController
  before_action :set_full_text, only: [:show, :edit, :update, :destroy]

  def index
    @full_texts = Full_text.all
  end

  def show
  end

  def new
    @full_text = Full_text.new
  end

  def create
    @full_text = Full_text.new(full_text_params)
    @full_text.user = current_user
    if full_text.save
      redirect_to full_text_path(@full_text)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @full_text.update(full_text_params)
      redirect_to full_text_path(@full_text)
    else
      render :edit
    end
  end

  def destroy
    @full_text.destroy
    redirect_to full_texts_path
  end

  private

  def set_full_text
    @full_text = Full_text.find(params[:id])
  end

  def full_text_params
    params.require(:full_text).permit(:title, :percentage)


end
