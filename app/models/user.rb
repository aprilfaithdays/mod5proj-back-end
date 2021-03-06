class User < ApplicationRecord
    has_many :workouts
    has_many :personal_libraries
    has_many :logs, dependent: :destroy
    has_many :comments, dependent: :destroy
    # has_many :playlists

    validates :username, uniqueness: true
    validates_presence_of :name, :username, :password

end
