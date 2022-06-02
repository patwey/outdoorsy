class Api::V1::BaseController < ApplicationController
  def json_response(data, status = :ok)
    payload = { data: data }

    render json: payload, status: status
  end
end
