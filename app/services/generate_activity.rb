class GenerateActivity
  include ActiveModel::Validations

  # Attributes
  attr_reader(
    :activities,
    :user
  )

  # Validations
  validates :activities, :user, presence: true

  def initialize(params={})
    @user       = params.fetch(:user, nil)
    @activities = params.fetch(:activities, [])
  end

  def call
    return Error.new(errors: self.errors) if !self.valid?

    ActiveRecord::Base.transaction  do
      activities_created = []
      @user_status = get_user_status
      @activities.each do |activity|
        fetched_activity = find_or_initialize(activity)
        activities_diff  = diff_between_activities(activity, fetched_activity)
        fetched_activity.update(steps: activity[:steps], distance: activity[:distance], kcal: activity[:kcal])
        update_user_status(activities_diff)
        activities_created << fetched_activity
      end
      @activities = activities_created
      update_user
    end
    Success.new
  end

  private

    def get_user_status
      User.new(total_steps:   @user.total_steps,
              total_distance: @user.total_distance,
              total_kcal:     @user.total_kcal)
    end

    def find_or_initialize(activity)
      @user.activities.find_or_initialize_by(done_at: activity[:done_at])
    end

    def diff_between_activities(new_activity, fetched_activity)
      Activity.new(
        steps:    (new_activity[:steps]    - fetched_activity.steps),
        distance: (new_activity[:distance] - fetched_activity.distance),
        kcal:     (new_activity[:kcal]     - fetched_activity.kcal)
      )
    end

    def update_user_status(activities_diff)
      @user_status.total_steps    += activities_diff.steps
      @user_status.total_distance += activities_diff.distance
      @user_status.total_kcal     += activities_diff.kcal
    end

    def update_user
      @user.update(
        total_steps: @user_status.total_steps,
        total_distance: @user_status.total_distance,
        total_kcal: @user_status.total_kcal
      )
    end

end
