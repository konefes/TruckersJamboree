class User < ActiveRecord::Base
    validates_uniqueness_of :username
    
    def User::create_user!(user_params)
        @session_token = SecureRandom.base64
        user_params[:session_token] = @session_token
        User.create!(user_params)
    end
    
end