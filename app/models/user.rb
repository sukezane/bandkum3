class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

         validates :terms, acceptance: true
         validates :name, presence: true, length: { maximum: 20 }
    # attr_accessor :login#emailとusernameでのログインを可能にする

#Chatty
  has_many :conversations, :foreign_key => :sender_id

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[8,72]
                        )
    end
    user
  end

  # deviseにログイン条件を上書きする
  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions).where(["name = :value OR lower(email) = lower(:value)", { :value => login }]).first
  #   else
  #     where(conditions).first
  #   end
  # end
 
  # def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
  #   user = User.where(:provider => auth.provider, :uid => auth.uid).first
  #   unless user
  #     user = User.create(name:     auth.info.nickname,
  #                        provider: auth.provider,
  #                        uid:      auth.uid,
  #                        email:    User.create_unique_email,
  #                        password: Devise.friendly_token[8,72]
  #                       )
  #   end
  #   user
  # end

  #          # 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
  # def self.create_unique_string
  #   SecureRandom.uuid
  # end
  #  # twitterではemailを取得できないので、適当に一意のemailを生成
  # def self.create_unique_email
  #   User.create_unique_string + "@example.com"
  # end
end
