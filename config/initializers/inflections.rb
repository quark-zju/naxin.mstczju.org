# coding : utf-8

# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#    inflect.uncountable %w( fish )
    # zh_cn doesn't have plural form.
    inflect.plural /^[^a-zA-Z].*$/, '\0'
end
