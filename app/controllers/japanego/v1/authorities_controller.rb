class Japanego::V1::AuthoritiesController < ApplicationController
  def index
    all_authorities = Authorities.order('member_no DESC')
    render json: {status: 'SUCCESS', message:'search all authoritiess', data:all_authorities},status: :ok
  end

  def show
    authorities = Authorities.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded authorities', data:authorities},status: :ok
  end

  def create
    authorities = Authorities.new(authorities_params)
    if authorities.save
      render json: {status: 'SUCCESS', message:'Created authorities', data:authorities},status: :ok
    else
      render json: {status: 'ERROR', message:'authorities not Saved', data:authorities.errors},status: :unprocessable_entity
    end
  end
  def update
    authorities = Authorities.find(params[:id])
    if authorities.update_attributes(authorities_params)
      render json: {status: 'SUCCESS', message:'Updated authorities', data:authorities},status: :ok
    else
      render json: {status: 'ERROR', message:'authorities not Updated', data:authorities.errors},status: :unprocessable_entity
    end
  end

  def destroy
    authorities = Authorities.find(params[:id])
    authorities.destroy
    authorities.destroy
    render json: {status: 'SUCCESS', message:'Deleted authorities', data:authorities},status: :ok
  end

  private

  def authorities_params
    params.permit(:MEMBER_NO, :AUTHORITY)
  end
end