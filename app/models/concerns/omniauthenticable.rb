module Omniauthenticable
    extend ActiveSupport::Concern

    included do
      def self.from_omniauth(auth)
        existing_user = User.find_by(email: auth['info']['email'])

        if existing_user
          existing_user.update!(provider: auth.provider, uid: auth.uid)
          existing_user
        else
          where(provider: auth.provider, uid: auth.uid).first_or_create do |users|
            users.email                 = auth.info.email
            users.password              = Devise.friendly_token[0, 20]
            users.password_confirmation = users.password
            users.name                  = auth.info.name
            users.skip_confirmation!
          end
        end
      end

      def self.new_with_session(params, session)
        super.tap do |user|
          data = session['devise.facebook_data'] &&
            session['devise.facebook_data']['extra']['raw_info']

          user.email = data['email'] if data && user.email.blank?
        end
      end
    end
  end