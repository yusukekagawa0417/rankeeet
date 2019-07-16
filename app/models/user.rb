class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :omniauthable

  has_many :rankings
  has_many :votes
  validates :name, presence: true, uniqueness: true

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, name: auth.info.name, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        name:     auth.info.name,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
