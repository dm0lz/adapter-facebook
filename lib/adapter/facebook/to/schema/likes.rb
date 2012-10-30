module Adapter
	module Facebook
		module To
			module Schema
				class Likes
					include Virtus
					include Discoverer::Writer
					attr_reader :_type
					attribute :count
					attribute :authors

					def initialize likes
						@_type = "http://schema.org/AggregateRating"
						coerce likes
					end

					def coerce likes
						@authors = []
						@count = likes["count"]
						likes["data"].each do |author| 
							@authors.push Adapter::Facebook::To::Schema::PersonUser.new author
						end
					end

				end
			end
		end
	end
end
