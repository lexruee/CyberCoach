class User < ActiveRecord::Base
  has_many :credits

  validates :password, presence: true, confirmation: true, length: { within: 4..10 }
  validates :real_name, presence: true
  validate :username_available, on: :create
  validates :email, email_format: { message: "Doesn't look like an email address!" }

  # create some virtual attributes
  def username=(param)
    @username = param
  end

  def username
    @username
  end

  def password=(param)
    @password = param
  end

  def password
    @password
  end

  def password_confirmation
    @password_confirmation
  end

  def password_confirmation=(param)
    @password_confirmation = param
  end

  def email=(param)
    @email = param
  end

  def email
    @email
  end

  def real_name
    @real_name
  end

  def real_name=(param)
    @real_name = param
  end

  def public_visible=(param)
    @public_visible = param
  end

  def public_visible
    @public_visible
  end


end
