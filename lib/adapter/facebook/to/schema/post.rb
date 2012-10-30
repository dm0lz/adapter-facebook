module Adapter
	module Facebook
		module To
			module Schema
				class Post
					include Virtus
					include Discoverer::Writer
					attr_reader :_type

					attribute :id
					attribute :author
					attribute :likes
					attribute :comments
					attribute :commentsCount

					def initialize post
						@_type = "http://schema.org/Article"
            coerce post
					end

					def coerce post
						@id = post["id"]
						@comments = []
						@author = Adapter::Facebook::To::Schema::PersonUser.new post["from"]
						@likes = Adapter::Facebook::To::Schema::Likes.new post["likes"]
						post["comments"]["data"].each do |comment|
							@comments.push Adapter::Facebook::To::Schema::Comment.new
						end
						@commentsCount = post["comments"]["count"]
					end


				end
			end
		end
	end
end
