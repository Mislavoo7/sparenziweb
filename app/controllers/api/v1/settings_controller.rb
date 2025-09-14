class Api::V1::SettingsController < Api::V1::BaseController
  before_action :authenticate_user

  # POST /api/v1/settings
  def update
    setting_type = params[:type]
    setting_value = params[:value]

    # Validate setting type
    unless valid_setting_type?(setting_type)
      return render json: {
        success: false,
        message: 'Invalid setting type'
      }, status: :bad_request
    end

    # Validate setting value based on type
    unless valid_setting_value?(setting_type, setting_value)
      return render json: {
        success: false,
        message: "Invalid value for #{setting_type}"
      }, status: :bad_request
    end

    begin
      # Update the user setting
      case setting_type
      when 'theme'
        current_user.update!(theme: setting_value)
      when 'language'
        current_user.update!(language_id: setting_value)
      when 'currency'
        current_user.update!(currency: setting_value)
      end

      render json: {
        success: true,
        message: 'Setting updated successfully',
        setting: {
          type: setting_type,
          value: setting_value
        }
      }, status: :ok

    rescue ActiveRecord::RecordInvalid => e
      render json: {
        success: false,
        message: 'Failed to update setting',
        errors: e.record.errors.full_messages
      }, status: :unprocessable_entity
    rescue StandardError => e
      render json: {
        success: false,
        message: 'An error occurred while updating setting'
      }, status: :internal_server_error
    end
  end

  private

  def valid_setting_type?(type)
    %w[theme language currency].include?(type)
  end

  def valid_setting_value?(type, value)
    case type
    when 'theme'
      User.allowed_themes.map{|c| c[1]}.include?(value)
    when 'language'
      User.allowed_languages.map{|c| c[1]}.include?(value)
    when 'currency'
      User.allowed_currencies.map{|c| c[1]}.include?(value)
    else
      false
    end
  end
end
