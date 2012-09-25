class PagesController < ApplicationController
  def about

  end

  def print
    raise ActionController::MethodNotAllowed.new(:about) unless current_staff

    @forms = Form.nospam.pending

    render layout: 'print'
  end
end
