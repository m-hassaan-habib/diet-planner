# frozen_string_literal: true

class Api::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    if (resource.save)
      bypass_sign_in(resource)
      render_resource(resource)
    else
      unprocessable_entity(resource.errors)
    end
  end
end
