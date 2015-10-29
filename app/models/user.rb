class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 8 }
  validate :passwords_match

  has_many :notes 


  private

  def passwords_match
    if password.present? && password != password_confirmation
      errors.add :password_confirmation, 'must match the password'
    end
  end
end
