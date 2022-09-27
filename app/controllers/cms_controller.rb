class CmsController < ApplicationController
  include Scrivito::ControllerActions

  before_action :filters, only: :index

    private

    def filters
      render :not_found, status: 404 unless page_live? || scrivito_in_editable_view?
    end

    def page_live?
      (@obj.valid_from && @obj.valid_from.before?(Time.current)) && (@obj.valid_until && @obj.valid_until.after?(Time.current))
    end

    # do not render :not_found if page is in editing mode

    # not when in editable mode (in controller or view)
    # valid_from after valid_until
    # error object that renders flash note
end
