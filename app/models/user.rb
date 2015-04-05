class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable,
         :lastseenable

  validates_presence_of :email, :role

  has_many :user_logins

  ROLES = %w(administrator supporter)

  def update_tracked_fields!(request)
    old_signin = self.last_sign_in_at
    super
    if self.last_sign_in_at != old_signin
      UserLogin.create :user_id => self.id, :sign_in_at => self.current_sign_in_at, :sign_in_ip => self.current_sign_in_ip
    end
  end

end
