class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image_file

  validates :title, presence: { message: 'タイトルを入力してください' },
  length: { maximum: 30, too_long: "タイトルは最大%{count}文字まで使えます" }

  validates :image_file, presence: { message: '画像ファイルを入力してください' }
end
