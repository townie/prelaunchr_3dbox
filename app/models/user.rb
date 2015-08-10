class User < ActiveRecord::Base
    belongs_to :referrer, :class_name => "User", :foreign_key => "referrer_id"
    has_many :referrals, :class_name => "User", :foreign_key => "referrer_id"

    attr_accessible :email

    validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." }
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code
    after_create :send_welcome_email

    REFERRAL_STEPS = [
        {
            'count' => 5,
            "html" => "Tube<br>Squzer",
            "class" => "two",
            "image" =>  ActionController::Base.helpers.asset_path("refer/tube.jpg")
        },
        {
            'count' => 10,
            "html" => "Bag<br>Carrier",
            "class" => "three",
            "image" => ActionController::Base.helpers.asset_path("refer/bagholder.jpg")
        },
        {
            'count' => 25,
            "html" => "6 Sided<br>Vase",
            "class" => "four",
            "image" => ActionController::Base.helpers.asset_path("refer/vase.jpg")
        },
        {
            'count' => 50,
            "html" => "Thinking<br>Trooper",
            "class" => "five",
            "image" => ActionController::Base.helpers.asset_path("refer/thinking_trooper.jpg")
        }
    ]

    private

    def create_referral_code
        referral_code = SecureRandom.hex(5)
        @collision = User.find_by_referral_code(referral_code)

        while !@collision.nil?
            referral_code = SecureRandom.hex(5)
            @collision = User.find_by_referral_code(referral_code)
        end

        self.referral_code = referral_code
    end

    def send_welcome_email
        UserMailer.delay.basic_email(self)
    end
end
