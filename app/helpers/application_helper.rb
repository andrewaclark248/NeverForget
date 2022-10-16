module ApplicationHelper

    def flash_class(level)
        
        if level == "notice"
            return "alert alert-success bg-success"
        elsif level == "error"
            return "alert alert-danger bg-danger"
        else
            return level
         end
    end

    def get_phones_based_on_plan plan_type
        if plan_type == "Bronze"
            return "0 Phones"
        elsif plan_type == "Silver"
            return "1 Phone"
        elsif plan_type == "Platnium"
            return "2 Phones"
        elsif plan_type == "Gold"
            return "3 Phones"
        elsif plan_type == "Adamantium"
            return "4 Phones"
        end
    end

    def is_active?(path)
        if request.path.include?(path)
            "text-dark"
        end
    end

    def get_minus_sign
        return '<i class="fa fa-minus" aria-hidden="true"></i>'.html_safe
    end

    def logo_text
        "<h3><span class='text-dark'>Safe</span><span class='text-danger'>Logins</span></h3>".html_safe
    end

    def striped_table index
        if index%2 == 0
            "password-table"
        else
            "bg-white"
        end
    end

    def add_url_btn
        "<div><i class='fa-solid fa-plus pe-2'></i><span class=''>Add URL</span></div>".html_safe
    end

    def get_pwd_color pwd_strength
        if pwd_strength == "poor"
            "bg-danger"
        elsif pwd_strength == "okay"
            "bg-warning"
        elsif pwd_strength == "strong"
            "bg-success"
        end
    end

end
