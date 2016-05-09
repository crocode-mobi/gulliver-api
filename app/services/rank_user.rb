class RankUser
  attr_reader(
    :page,
    :ranked_users
  )

  def initialize(params={})
    @filter = params.fetch(:filter, nil)
    @page = params.fetch(:page, 1)
  end

  def by_distance
    @ranked_users = User.order(total_distance: :desc).page(@page)
  end

  def by_steps
    @ranked_users = User.order(total_steps: :desc).page(@page)
  end

end
