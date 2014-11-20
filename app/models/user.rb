class User < ActiveRecord::Base
  has_many :credits
  has_many :sport_sessions
  has_many :sport_sessions, through: :sport_session_participants
  has_many :sport_session_participants

  validates :password, presence: true, confirmation: true, length: { within: 4..10 }
  validates :real_name, presence: true
  validates :username, presence: true, length: { within: 4..50 }
  validates :email, email_format: { message: "Doesn't look like an email address!" }

  # create some virtual attributes
  # def username=(param)
  #   @username = param
  # end
  #
  # def username
  #   @username
  # end
  #
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

  def sport_sessions_confirmed(type='')
    SportSession.all_sport_sessions_confirmed_from_user(self.id, type)
  end

  def sport_sessions_unconfirmed(type='')
    SportSession.all_sport_sessions_unconfirmed_from_user(self.id, type)
  end

  def sport_sessions_filtered(params)
    SportSession.all_sport_sessions_filtered_from_user(self.id, params)
  end

end
