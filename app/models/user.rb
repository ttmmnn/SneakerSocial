class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # foreign_keyで参照するカラムを指定
  # relationshipsとreverse_of_relationshipsは、わかりにくいため名前をつけているだけ
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # user.followersとuser.followingsという記述でフォロワーを表示したいので、throughでスルーするテーブル、sourceで参照するカラムを指定
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates:introduction, length:{maximum: 100}



  # 画像のサイズ調整と画像がない場合のデフォルト設定
  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.png')
      profile_image.attach(io: File.open(file_path),filename: 'default-image.png',content_type: 'image/png')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # フォローした時の処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  # フォローした時の処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  def active_for_authentication?
    super && (members_status == false)
  end

  # ransack 検索許可カラム（属性）
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

end
