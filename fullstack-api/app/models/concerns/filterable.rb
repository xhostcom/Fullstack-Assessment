module Filterable
    extend ActiveSupport::Concern 

        class_methods do
            def filter(params)
            return self.all unless params.key? :filter 
                    params[:filter].inject(self) do |query, (attribute, value)|
                    query.where(attribute.to_sym => value) if value.present?
                    end
            end
        end
end