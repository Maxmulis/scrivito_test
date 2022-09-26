class CmsController < ApplicationController
  include Scrivito::ControllerActions

  before_action only: :index do
      if (@obj.valid_from && @obj.valid_from > Time.current) ||
        (@obj.valid_until && @obj.valid_until < Time.current)
        render :not_found, status: 404
      end
    # do not render :not_found if page is in editing mode

    # not when in editable mode (in controller or view)
    # valid_from after valid_until
    # error object that renders flash note
  end
end
