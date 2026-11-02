class RatingSerializer
  def initialize(rating) = @rating = rating

  def as_json(*)
    {
      id: @rating.id,
      trip_id: @rating.trip_id,
      score: @rating.score,
      comment: @rating.comment,
      created_at: @rating.created_at
    }
  end
end
