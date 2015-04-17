def get_score
  @votes > 10 ? base_score * 1.05 : base_score
end
