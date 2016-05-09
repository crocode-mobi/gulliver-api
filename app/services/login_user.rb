class LoginUser
  include ActiveModel::Validations

  # Attributes
  attr_reader(
    :email,
    :password,
    :device,
    :ip,
    :push_token,
    :user,
    :token
  )

  # Validations
  validates :email, :password, :device, presence: true
  validates :device, inclusion: { in: %w(ios android web),
                     message: "%{value} is not a valid device" }

  def initialize(params={})
    @email = params.fetch(:email, nil)
    @password = params.fetch(:password, nil)
    @device = params.fetch(:device, nil)
    @ip = params.fetch(:ip, nil)
    @push_token = params.fetch(:push_token, nil)
  end

  def call
    return Error.new(errors: self.errors) if !self.valid?

    @user = User.authenticate(@email, @password)

    if @user
      generate_authentication_token(@push_token, @device, @ip)
      Success.new
    else
      Error.new(errors: "Invalid email or password")
    end
  end

  private

    def generate_authentication_token(pushtoken="", device="", ip="")
      @token = @user.generate_token(pushtoken, device, ip)
    end
end
