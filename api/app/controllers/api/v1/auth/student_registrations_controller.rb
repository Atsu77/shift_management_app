class Api::V1::Auth::StudentRegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.permit(:email, :password)
  end
end