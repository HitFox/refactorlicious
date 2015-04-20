def get_score
  more_than_ten_votes ? base_score * 1.05 : base_score
end

def more_than_ten_votes
  @votes > 10
end

#SOLUTION
def get_score
  @votes > 10 ? base_score * 1.05 : base_score
end
