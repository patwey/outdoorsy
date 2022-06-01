class ApplicationController < ActionController::Base
  def json_response(data, status = :ok)
    payload = { data: data }

    render json: payload, status: status
  end
end
