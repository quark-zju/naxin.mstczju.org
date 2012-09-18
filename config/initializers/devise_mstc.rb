require 'net/http'
require 'json'

module Devise
  module Strategies
    # Default strategy for signing in a user, based on his email and password in the database.
    class RemoteAuthenticatable < Authenticatable
      def authenticate!
        # available here: authentication_hash (contains email), params, mapping

        email    = authentication_hash[:email]
        password = params[mapping.name][:password]

        email <<= mapping.to.email_postfix if ! email['@']

        result = JSON.parse(Net::HTTP.post_form(URI(mapping.to.remote_authenticate_url), 
                                                username: email.sub(mapping.to.email_postfix, ''),
                                                password: password).body)

        if result['success'] == true
          resource = mapping.to.find_by_email(email) || mapping.to.create(email: email, name: result['name'])
          success!(resource)
        end
      end
    end
  end

  module Models
    module RemoteAuthenticatable
    end
  end
end

Warden::Strategies.add(:remote_authenticatable, Devise::Strategies::RemoteAuthenticatable)

Devise.add_module(:remote_authenticatable,
                  :strategy => true,
                  :controller => :sessions,
                  route: { session: [:new, :destroy]})


