module ApplicationHelper
  #Form helpers
  def form_errors(object)
    render partial: "form_errors", locals: {object: object}
  end
end
