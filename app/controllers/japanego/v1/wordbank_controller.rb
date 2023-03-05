class Japanego::V1::WordbankController < ApplicationController
  def index
    wordbanks = Wordbank.order('no DESC')
    render json: {status: 'SUCCESS', message:'search all wordbanks', data:wordbanks},status: :ok
  end

  def show
    wordbank = Wordbank.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded wordbank', data:wordbank},status: :ok
  end

  def create
    wordbank = Wordbank.new(wordbank_params)
    wordbank.NO = wordbank.last.id + 1;
    if wordbank.save
      render json: {status: 'SUCCESS', message:'Created wordbank', data:wordbank},status: :ok
    else
      render json: {status: 'ERROR', message:'wordbank not Saved', data:wordbank.errors},status: :unprocessable_entity
    end
  end
  def update
    wordbank = Wordbank.find(params[:id])
    if wordbank.update_attributes(wordbank_params)
      render json: {status: 'SUCCESS', message:'Updated wordbank', data:wordbank},status: :ok
    else
      render json: {status: 'ERROR', message:'wordbank not Updated', data:wordbank.errors},status: :unprocessable_entity
    end
  end

  def destroy
    wordbank = Wordbank.find(params[:id])
    wordbank.destroy
    wordbank.destroy
    render json: {status: 'SUCCESS', message:'Deleted wordbank', data:wordbank},status: :ok
  end

  private

  def wordbank_params
    params.permit(:EMAIL, :PASSWORD, :CREATE_DATE, :MODIFIED_DATE, :DEL_FLAG, :CERTIFY_FLAG, :GRADE)
  end
end