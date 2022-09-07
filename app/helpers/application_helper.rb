module ApplicationHelper

    def flash_class(level)
        
        if level == "notice"
            return "alert alert-success"
        end
        if level == "error"
            return "alert alert-danger"
        end

    end
end
