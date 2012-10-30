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
					attribute :likes

					def initialize comments
						@_type = "http://schema.org/UserComments"
						coerce comments
					end

					def coerce comments

					end
					
				end
			end
		end
	end
end
