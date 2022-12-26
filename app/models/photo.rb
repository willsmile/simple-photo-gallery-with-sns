class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image_file do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end

  def image_url
    if Rails.env.production?
      # 有効期限付きのURLが発行される
      # デフォルトの有効期限はconfig.active_storage.urls_expire_inによる設定
      image_file.url
    else
      # 本番以外（開発・テストを想定）の環境は永続的なURLが発行される
      Rails.application.routes.url_helpers.rails_blob_url(image_file, host: 'localhost:3000')
    end
  end

  validates :title, presence: { message: 'タイトルを入力してください' },
  length: { maximum: 30, too_long: "タイトルは最大%{count}文字まで使えます" }

  validates :image_file, presence: { message: '画像ファイルを入力してください' }
end
