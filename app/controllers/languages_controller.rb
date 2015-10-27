class LanguagesController < ApplicationController
  before_action :require_user
  before_action :set_language, only: [:show, :edit, :update, :destroy]

  def index
    @languages = current_user.languages
  end

  def new
    @language = Language.new
  end

  def create
    @language = current_user.languages.new(language_params)

    if @language.save
      redirect_to :languages, notice: "New language was successfully created."
    else
      render :new
    end
  end

  def destroy
    @language.destroy
    redirect_to :languages
  end

  private

    def set_language
      @language = current_user.languages.find(params[:id])
    end

    def language_params
      params.require(:language).permit(:name, :experience, :certificate)
    end
end
