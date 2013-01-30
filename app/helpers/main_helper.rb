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

def get_meat_ingredients
  ['bacon', 'kidneys', 'rubber', 'Firefox']
end

def get_veggie_ingredients
  ['ostrich egg', 'milk', 'fungus']
end

def get_vegan_ingredients
  ['Oak', 'Redwood', 'Juniper']
end


end
