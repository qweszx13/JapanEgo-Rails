class Japanego::V1::AuthorityController < ApplicationController
  def index
    authorities = authority.order('member_no DESC')
    render json: {status: 'SUCCESS', message:'search all authorities', data:authorities},status: :ok
  end

  def show
    authority = authority.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded authority', data:authority},status: :ok
  end

  def create
    authority = authority.new(authority_params)
    authority.NO = authority.last.id + 1;
    if authority.save
      render json: {status: 'SUCCESS', message:'Created authority', data:authority},status: :ok
    else
      render json: {status: 'ERROR', message:'authority not Saved', data:authority.errors},status: :unprocessable_entity
    end
  end
  def update
    authority = authority.find(params[:id])
    if authority.update_attributes(authority_params)
      render json: {status: 'SUCCESS', message:'Updated authority', data:authority},status: :ok
    else
      render json: {status: 'ERROR', message:'authority not Updated', data:authority.errors},status: :unprocessable_entity
    end
  end

  def destroy
    authority = authority.find(params[:id])
    authority.destroy
    authority.destroy
    render json: {status: 'SUCCESS', message:'Deleted authority', data:authority},status: :ok
  end

  private

  def authority_params
    params.permit(:MEMBER_NO, :AUTHORITY)
  end
end