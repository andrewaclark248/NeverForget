module Filter
    class Key
        include ActiveModel::Model 
        
        attr_accessor :key, :value, :radio_btn_value, :user


        def search
            result_keys = search_key if key.present?
            result_keys = search_value if value.present?
            result_keys
        end

        def keys
            @keys = user.keys
        end


        def search_key
            array_of_keys = keys.filter {|k| k.key.downcase.include?(key.downcase)} #ignorecase
            ::Key.where(id: array_of_keys.pluck(:id))
        end

        def search_value
            array_of_keys = keys.filter {|k| k.value.downcase.include?(value.downcase)} #ignorecase
            ::Key.where(id: array_of_keys.pluck(:id))
        end

    end
end