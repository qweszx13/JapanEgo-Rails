class Japanego::V1::Word_wordbank_relation < ApplicationController
  def index
    all_word_wordbank_relation = Word_wordbank_relation.order('no DESC')
    render json: {status: 'SUCCESS', message:'search all word_wordbank_relations', data:all_word_wordbank_relation},status: :ok
  end

  def show
    word_wordbank_relation = Word_wordbank_relation.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded word_wordbank_relation', data:word_wordbank_relation},status: :ok
  end

  def create
    word_wordbank_relation = Word_wordbank_relation.new(word_wordbank_relation_params)
    if word_wordbank_relation.save
      render json: {status: 'SUCCESS', message:'Created word_wordbank_relation', data:word_wordbank_relation},status: :ok
    else
      render json: {status: 'ERROR', message:'word_wordbank_relation not Saved', data:word_wordbank_relation.errors},status: :unprocessable_entity
    end
  end
  def update
    word_wordbank_relation = Word_wordbank_relation.find(params[:id])
    if word_wordbank_relation.update_attributes(word_wordbank_relation_params)
      render json: {status: 'SUCCESS', message:'Updated word_wordbank_relation', data:word_wordbank_relation},status: :ok
    else
      render json: {status: 'ERROR', message:'word_wordbank_relation not Updated', data:word_wordbank_relation.errors},status: :unprocessable_entity
    end
  end

  def destroy
    word_wordbank_relation = Word_wordbank_relation.find(params[:id])
    word_wordbank_relation.destroy
    word_wordbank_relation.destroy
    render json: {status: 'SUCCESS', message:'Deleted word_wordbank_relation', data:word_wordbank_relation},status: :ok
  end

  private

  def word_wordbank_relation_params
    params.permit(:NO, :OWNER_NO, :WORDBANK_NO, :NAME, :CREATE_DATE, :MODIFIED_DATE, :DEL_FLAG)
  end
end