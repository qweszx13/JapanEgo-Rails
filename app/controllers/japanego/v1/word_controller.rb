class Japanego::V1::WordController < ApplicationController
  def index
    if params[:search]
      words = Word.where("WORD LIKE #{ params[:search] }
                       OR HURIGANA LIKE #{ params[:search] }
                       OR OKURIGANA LIKE #{ params[:search] }
                       OR YOMIGANA LIKE #{ params[:search] }
                         ").paginate(page: params[:page], per_page: params[:size])
      render json: {status: 'SUCCESS', message:'search all Words', data:words},status: :ok
    else
      words = Word.paginate(page: params[:page], per_page: params[:size])
      render json: {status: 'SUCCESS', message:'Loaded all Words', data:words},status: :ok
    end
  end

  def search

  end

  def show
    word = Word.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded Word', data:word},status: :ok
  end

  def create
    word = Word.new(word_params)
    if word.save
      render json: {status: 'SUCCESS', message:'Created Word', data:word},status: :ok
    else
      render json: {status: 'ERROR', message:'Word not Saved', data:word.errors},status: :unprocessable_entity
    end
  end

  def update
    word = Word.find(params[:id])
    if word.update_attributes(word_params)
      render json: {status: 'SUCCESS', message:'Updated Word', data:word},status: :ok
    else
      render json: {status: 'ERROR', message:'Word not Updated', data:word.errors},status: :unprocessable_entity
    end
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    render json: {status: 'SUCCESS', message:'Deleted Word', data:word},status: :ok
  end

  private

  def word_params
    params.permit(:NO, :WORD, :HURIGANA, :OKURIGANA, :YOMIGANA, :MEAN, :GRADE)
  end

end
