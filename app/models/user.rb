class User < ActiveRecord::Base
	has_many :wines, dependent: :destroy
	has_many :searches, dependent: :destroy

	validates :email, uniqueness:{ case_sensitive: false}, presence: true
	validates :password, presence: true

  has_secure_password
  validates :email, uniqueness: {case_sensitive: false}, presence: true

    def generate_password_reset_token!
  		update(password_reset_token: SecureRandom.urlsafe_base64(48))
		end

end

