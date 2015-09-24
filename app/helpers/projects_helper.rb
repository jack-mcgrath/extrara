module ProjectsHelper
    def resource_name
        :project
    end
    
    def resource
        @resource ||= Project.new
    end
    
    def router_name
    end
end
