module BugherdClient
  module Resources
    class Project < Base

      #
      # Get more detail of your account.
      # API: 1,2
      def all
        raw_response = get_request('projects')
        parse_response(raw_response, :projects)
      end

      #
      # Show details for a specific project
      # API: 1,2
      def find(project_id)
        raw_response = get_request("projects/#{project_id}")
        parse_response(raw_response, :project)
      end

      #
      # Create a Project, will initially have no members
      # attributes: name, devurl, is_public, is_active
      # API: 1,2
      # 
      def create(attributes={})
        if (attributes[:is_active] or attributes[:is_public]) and !self.options[:api_version].eql?(2)
          raise BugherdClient::Errors::UnsupportedAttributes, :v2, [:is_public, :is_active]
        end
        raw_response = post_request("projects", project: attributes)
        parse_response(raw_response, :project)
      end

      #
      # Update settings for an existing project under your control (ie: only the ones you own).
      # API: 1,2
      def update(project_id, attributes={})
        raw_response = put_request("projects/#{project_id}", project: attributes)
        parse_response(raw_response, :project)
      end

      # 
      # Delete a project and all associated data. Use with care, deleted projects cannot be recovered.
      # API: 1,2
      def delete(project_id)
        raw_response = delete_request("projects/#{project_id}")
        parse_response(raw_response)
      end

      # 
      # Add an existing guest to a project, or invite someone by email address.
      # attributes: user_id, email
      # API: 2
      def add_guest(project_id, attributes={})
        raw_response = post_request("projects/#{project_id}/add_guest", attributes)
        parse_response(raw_response)
      end

      # 
      # Add an existing guest to a project, or invite someone by email address.
      # attributes: user_id
      # API: 2
      def add_member(project_id, attributes={})
        raw_response = post_request("projects/#{project_id}/add_member", attributes)
        parse_response(raw_response)
      end


      #
      # Get all active projects
      # API: 2
      def active
        raise BugherdClient::Errors::UnsupportedMethod, :v2 unless self.options[:api_version].eql?(2)
        raw_response = get_request('projects/active')
        parse_response(raw_response, :projects)
      end
    end
  end
end