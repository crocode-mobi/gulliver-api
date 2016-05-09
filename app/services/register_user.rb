class RegisterUser
  include ActiveModel::Validations

  # Attributes
  attr_reader(
    :user,
    :token,
    :push_token,
    :device,
    :ip
  )

  # Validations
  validates :user, :device, presence: true
  validates :device, inclusion: { in: %w(ios android web),
                     message: "%{value} is not a valid device" }

  def initialize(params={})
    @user = params.fetch(:user, User.new)
    @push_token = params.fetch(:push_token, nil)
    @device = params.fetch(:device, nil)
    @ip = params.fetch(:ip, nil)
  end

  def call
    return Error.new(errors: @user.errors)  if !@user.valid?
    return Error.new(errors: self.errors)   if !self.valid?

    if @user.save
      generate_authentication_token(@push_token, @device, @ip)
      Success.new
    else
      Error.new(errors: @user.errors)
    end
  end

  private

    def generate_authentication_token(pushtoken="", device="", ip="")
      @token = @user.generate_token(pushtoken, device, ip)
    end

end
