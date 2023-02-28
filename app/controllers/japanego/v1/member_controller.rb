class Japanego::V1::MemberController < ApplicationController
  def index
    members = Member.order('no DESC')
    render json: {status: 'SUCCESS', message:'search all members', data:members},status: :ok
  end

  def show
    member = Member.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded member', data:member},status: :ok
  end

  def create
    member = Member.new(member_params)
    member.NO = Member.last.id + 1;
    memeber_email_verification(member.EMAIL) ? nil : return
    if member.save
      render json: {status: 'SUCCESS', message:'Created member', data:member},status: :ok
    else
      render json: {status: 'ERROR', message:'member not Saved', data:member.errors},status: :unprocessable_entity
    end
  end
  def update
    member = Member.find(params[:id])
    if member.update_attributes(member_params)
      render json: {status: 'SUCCESS', message:'Updated member', data:member},status: :ok
    else
      render json: {status: 'ERROR', message:'member not Updated', data:member.errors},status: :unprocessable_entity
    end
  end

  def destroy
    member = Member.find(params[:id])
    member.destroy
    member.destroy
    render json: {status: 'SUCCESS', message:'Deleted member', data:member},status: :ok
  end

  private

  def memeber_email_verification(email)
    if Member.find_by(EMAIL: email)
      render json: {status: 'ERROR', message:'Already Signup Email'},status: :forbidden
      return false
    end
    return true
  end

  def member_params
    params.permit(:EMAIL, :PASSWORD, :CREATE_DATE, :MODIFIED_DATE, :DEL_FLAG, :CERTIFY_FLAG, :GRADE)
  end
end