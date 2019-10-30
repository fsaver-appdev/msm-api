# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :string
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Director < ApplicationRecord
  def Director.youngest
    return Director.order({ :dob => :desc }).at(0)
  end

  def Director.eldest
    return Director.where.not({ :dob => nil }).order({ :dob => :asc }).at(0)
  end

  def filmography
    return Movie.where({ :director_id => self.id })
  end
end
