# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :string
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Actor < ApplicationRecord
  def characters
    return Character.where({ :actor_id => self.id })
  end

  def filmography
    array_of_movie_ids = characters.pluck(:movie_id)

    return Movie.where({ :id => array_of_movie_ids })
  end
end
