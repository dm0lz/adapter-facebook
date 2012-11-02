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
					attribute :likesCount
					attribute :comments
					attribute :commentsCount

					def initialize post
						@_type = "http://schema.org/Article"
            coerce post
					end

					def coerce post
						@id = post["id"]
						@comments = []
						@likes = []
						@author = Adapter::Facebook::To::Schema::PersonUser.new post["from"]
						post["likes"]["data"].each do |like|
							puts like
							@likes.push Adapter::Facebook::To::Schema::Like.new like
						end
						@likesCount = post["likes"]["count"]
						post["comments"]["data"].each do |comment|
							@comments.push Adapter::Facebook::To::Schema::Comment.new comment
						end
						@commentsCount = post["comments"]["count"]
					end


				end
			end
		end
	end
end
