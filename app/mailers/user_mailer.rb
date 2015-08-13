class UserMailer < ActionMailer::Base
    default from: "3dbox.club <info@3dbox.club>"

    def signup_email(user)
        attachments.inline['small_logo.png'] = File.read( Rails.root.join("app","assets","images","email","small_logo.png"))
        attachments.inline['3dboxemail.png'] = File.read( Rails.root.join("app","assets","images","email","3dboxemail.png"))
        attachments.inline['refer.jpg'] = File.read( Rails.root.join("app","assets","images","email","refer.jpg"))
        attachments.inline['facebook.jpg'] = File.read( Rails.root.join("app","assets","images","email","facebook.jpg"))
        attachments.inline['twitter.jpg'] = File.read( Rails.root.join("app","assets","images","email","twitter.jpg"))

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
