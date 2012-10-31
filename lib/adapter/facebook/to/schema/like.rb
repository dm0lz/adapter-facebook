module Adapter
	module Facebook
		module To
			module Schema
				class Like
					include Virtus
					include Discoverer::Writer
					attr_reader :_type
					attribute :author

					def initialize like
						@_type = "http://schema.org/AggregateRating/Like"
						coerce like
					end

					def coerce like
						@author	= Adapter::Facebook::To::Schema::PersonUser.new like
					end

				end
			end
		end
	end
end
