module MainHelper

# Decorates object.field with appropriate bootstrap markup, possibly containing
# error messages.
def wrap_field_with_error(object, field)
  error = object.errors[field].collect {|e| "#{field.capitalize} #{e}"}[0]
  has_error = error
  content_tag(:div, class: has_error ? 'control-group error' : 'control-group') do
    yield
    concat content_tag(:div, error, class: 'help-block') if has_error
  end
end

end
