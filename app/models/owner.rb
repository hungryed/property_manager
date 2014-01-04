class Owner < ActiveRecord::Base
  has_many :buildings,
    dependent: :nullify,
    inverse_of: :owner
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_email_format_of :email

  class << self
    def create_display_string(hash)
      first_name = hash[:first_name]
      last_name = hash[:last_name]
      "#{first_name} #{last_name}"
    end
  end

end
