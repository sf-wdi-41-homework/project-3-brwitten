class UserArticle < ApplicationRecord

  belongs_to :User
  belongs_to :Article

end
