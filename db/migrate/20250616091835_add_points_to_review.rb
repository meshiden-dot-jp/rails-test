class AddPointsToReview < ActiveRecord::Migration[8.0]
  def change
    add_column :reviews, :points, :integer
  end
end
