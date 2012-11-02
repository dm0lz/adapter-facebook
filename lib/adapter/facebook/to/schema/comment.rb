module Adapter
	module Facebook
		module To
			module Schema
				class Comment
					include Virtus
					include Discoverer::Writer
					attr_reader :_type
					attribute :id
					attribute :author
					attribute :text
					attribute :likes_count
					attribute :created_time

					def initialize comments
						@_type = "http://schema.org/UserComments"
						coerce comments
					end

					def coerce comment
						@id = comment["id"]
						@author = Adapter::Facebook::To::Schema::PersonUser.new(comment["from"])
						@text = comment["message"]
						@likes_count = comment["likes"]
						@created_time = comment["created_time"]
					end
				end
			end
		end
	end
end
