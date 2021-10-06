class Api::V1::SubjectsController < ApplicationController
  def show
    user = current_api_v1_teacher
    render json: {
      status: :ok,
      teacher: user,
      subjects: user.subjects
      }
  end

  def create
    user = current_api_v1_teacher
    subjects = user.subjects.build(subject_params.to_h)
    if subjects.save!
      render json: {
        status: :ok,
        teacher: user,
        subjects: subjects
      }
    elsif subjects
      response_bad_request
    else
      response_unauthorized
    end
  end

  def update
    user = current_api_v1_teacher
    if subjects = user.subjects.update(subject_params.to_h)
      render json: {
        status: :ok,
        teacher: user,
        subjects: subjects
      }
    elsif subjects
      response_bad_request
    else
      response_unauthorized
    end
  end

  private 
  def subject_params
    params.require(:subjects).permit(:japanese, :society, :math, :science, :english)
  end
end
