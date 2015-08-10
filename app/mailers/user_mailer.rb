class UserMailer < ActionMailer::Base
    default from: "3dbox.club <info@3dbox.club>"

    def signup_email(user)
        @user = user
        @twitter_message = "Get the lastest #3dprints from @3dboxclub. Excited for launch!"

        mail(:to => user.email, :subject => "Thanks for signing up!")
    end

    def basic_email(user)
        @user = user
        @twitter_message = "Get the lastest #3dprints from @3dboxclub. Excited for launch!"

        mail(:to => user.email, :subject => "Thanks for signing up!")
    end
end
