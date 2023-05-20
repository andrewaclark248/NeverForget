module Filter
    class Password
        include ActiveModel::Model 
        
        attr_accessor :url, :pwd_strength, :username, :insecure_pwds, :user, :radio_btn_value, :compromised_pwds, :compromised_usernames, :password, :current_user


        def search
            passwords = search_urls if url.present?
            passwords = search_password if password.present?
            passwords = search_username if username.present?
            passwords
        end



        def passwords
            @passwords = user.passwords
        end
        
        def search_password
            array_of_passwords = passwords.filter {|p| p.password.downcase.include?(password.downcase)} #ignorecase
            ::Password.where(id: array_of_passwords.pluck(:id))
        end

        def search_urls
            passwords.joins(:urls).where(Url.arel_table["name"].matches("%#{url.downcase}%"))
        end

        def search_username
            passwords.where(::Password.arel_table["username"].matches("%#{username.downcase}%"))
        end


    end
end