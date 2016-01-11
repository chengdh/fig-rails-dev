#coding: utf-8
class UserFavoritesController < ApplicationController
  before_action :set_user_favorite, only: [:show, :edit, :update, :destroy]

  # GET /user_favorites
  # GET /user_favorites.json
  def index
    @user_favorites = UserFavorite.ransack(params[:q]).result
  end

  # GET /my_favorites/:user_id
  # GET /my_favorites/:user_id
  def my_favorites
    @user_favorites = UserFavorite.favorites_with_user(params[:user_id])
  end

  # GET /user_favorites/1
  # GET /user_favorites/1.json
  def show
  end

  # GET /user_favorites/new
  def new
    @user_favorite = UserFavorite.new
  end

  # GET /user_favorites/1/edit
  def edit
  end

  # POST /user_favorites
  # POST /user_favorites.json
  def create
    @user_favorite = UserFavorite.new(user_favorite_params)

    respond_to do |format|
      if @user_favorite.save
        format.html { redirect_to @user_favorite, notice: 'User favorite was successfully created.' }
        format.json { render :show, status: :created, location: @user_favorite }
      else
        format.html { render :new }
        format.json { render json: @user_favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_favorites/1
  # PATCH/PUT /user_favorites/1.json
  def update
    respond_to do |format|
      if @user_favorite.update(user_favorite_params)
        format.html { redirect_to @user_favorite, notice: 'User favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_favorite }
      else
        format.html { render :edit }
        format.json { render json: @user_favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_favorites/1
  # DELETE /user_favorites/1.json
  def destroy
    @user_favorite.destroy
    respond_to do |format|
      format.html { redirect_to user_favorites_url, notice: 'User favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_favorite
      @user_favorite = UserFavorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_favorite_params
      params.require(:user_favorite).permit!
    end
end
