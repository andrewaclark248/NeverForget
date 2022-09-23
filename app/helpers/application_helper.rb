module ApplicationHelper

    def flash_class(level)
        
        if level == "notice"
            return "alert alert-success"
        elsif level == "error"
            return "alert alert-danger"
        else
            return level
         end
         binding.pry
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
            "active-tab"
        end
    end

    def is_active2?(path)
        if request.path.include?(path)
            "text-dark"
        end
    end

end
