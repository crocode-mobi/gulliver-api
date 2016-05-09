class RaceStatus
  include ActiveModel::Validations

  attr_reader(
    :date_at,
    :from,
    :to,
    :size,
    :current_user,
    :current_meal,
    :current_hydratation,
    :competitors
  )

  # Validations
  validates :current_user, presence: true
  validates :date_at, :from, :to, :size, presence: true

  def initialize(params={})
    @current_user = params.fetch(:current_user, nil)
    @date_at = params.fetch(:date_at, Time.zone.today)
    @from = params.fetch(:from, 0).to_i
    @to   = params.fetch(:to, 100).to_i
    @size = params.fetch(:size, 100).to_i
  end

  def call
    return Error.new(errors: self.errors) if !self.valid?
    @current_meal        = get_meals_status(@date_at)
    @current_hydratation = get_hydratation_status(@date_at)
    @competitors         = get_competitors(from, to, size)
    Success.new
  end

  private

    def get_meals_status(date)
      meal = @current_user.meals.find_by(consumed_at: date)
      @current_user.prepare_for_meal(date) if !meal
      meal
    end

    def get_hydratation_status(date)
      hydratation = @current_user.hydratations.find_by(consumed_at: date)
      @current_user.hydratate(0) if !hydratation
      hydratation
    end

    def get_competitors(from, to, size)
      competitors = []
      queries_number = (to/size.to_f).round
      queries_number.times do |i|
        competitor = interval_competitors(from + i*size, size)
        competitors << competitor if competitor
      end
      competitors
    end

    def interval_competitors(from, size)
      to = from + size
      User.where('total_distance >= ? AND total_distance < ?', from, to)
          .not_me(@current_user)
          .limit(1)
          .first
    end

end
