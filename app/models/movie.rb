class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  # has_many :lists, through: :bookmarks

  # You can’t delete a movie if it is referenced in at least one bookmark.
  # this by defaut will not allow you to delete a movie
  # if it is connected to bookmarks
  # if you try to delete it it will say you have bookmark connections
  # and it cannot delete
  validates :title, uniqueness: true
  validates :overview, uniqueness: true
end
