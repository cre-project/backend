module Api
  class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_user

    private

    def authenticate_request
      @current_user = AuthorizeApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end

    def authenticate_from_pdf_app
      if request.headers["HTTP_PDF_APP_API_KEY"] != ENV["PDF_APP_API_KEY"]
        render json: { error: 'Not Authorized' }, status: 401
      end
    end
  end
end
