class User < ActiveRecord::Base
    has_secure_password
    validates_uniqueness_of :username
    validates :username, presence: true
    
    VALID_EMAIL_REGEX	=	/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates	:email,	presence:	true,	
				format:	{with:	VALID_EMAIL_REGEX}
				
	validates :password, presence: true, length: {minimum: 6}

    def User::create_user!(user_params)
        @session_token = SecureRandom.base64
        user_params[:session_token] = @session_token
        User.create!(user_params)
    end
    
    def email_with_role
        "#{self.email} (#{self.role})"
    end
    
end