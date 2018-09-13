class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
         
  has_one :assessment_self, dependent: :destroy
  has_one :userprofile, dependent: :destroy
  has_many :assessment_others, dependent: :destroy
  has_many :reverses_of_assessment_others, class_name: 'AssessmentOther', foreign_key: 'requesteduser_id'

  def self.find_for_oauth(auth)


    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = User.dummy_email(auth)
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
    
    # user = User.where(uid: auth.uid, provider: auth.provider).first

    # unless user
    #   user = User.create(
    #     name:     auth.info.name,
    #     uid:      auth.uid,
    #     provider: auth.provider,
    #     email:    User.dummy_email(auth),
    #     password: Devise.friendly_token[0, 20]
    #   )
    # end

    end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
  
  
end
