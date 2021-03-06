class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user

  #arrange articles in order from newest to old
  default_scope {order(created_at: :desc)}

end
