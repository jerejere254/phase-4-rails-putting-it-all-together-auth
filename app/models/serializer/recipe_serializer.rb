class RecipeSerializer < ActiveModel::Serializer
  attributes :id ,:title,:description,:minutes_to_complete
  belongs_to :user
end