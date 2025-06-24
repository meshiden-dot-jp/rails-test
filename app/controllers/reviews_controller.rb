class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :authorize_review_edit!, only: [:edit, :update, :destroy]


  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = "レビューを作成しました。"
      redirect_to @review
    else
      flash.now[:alert] = "レビューの作成に失敗しました。"
      render :new
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
  if @review.update(review_params)
      flash[:notice] = "レビューを更新しました。"
      redirect_to @review
    else
      flash.now[:alert] = "レビューの更新に失敗しました。"
      render :edit
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    flash[:notice] = "レビューを削除しました。"
    redirect_to reviews_path
  end

  def authorize_review_edit!
    unless current_user&.role == "admin" || @review.user == current_user
      flash[:alert] = "このレビューを編集する権限がありません。"
      redirect_to reviews_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.expect(review: [ :content, :movie_id, :user_id, :points ])
    end

    def current_user
      Session.find_by(id: cookies.signed[:session_id])&.user
    end
end
