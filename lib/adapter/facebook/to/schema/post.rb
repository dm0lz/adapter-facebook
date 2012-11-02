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
					attribute :likes_type
					attribute :likes_count
					attribute :comments
					attribute :commentsCount
					attribute :text
					attribute :created_time

					def initialize post
						@_type = "http://schema.org/Article"
            coerce post
					end

					def coerce post
						@likes_type = "http://schema.org/AggregateRating/Likes"
						@id = post["id"]
						@comments = []
						@likes = []
						@text = post["text"]
						@created_time = post["created_time"]
						@author = Adapter::Facebook::To::Schema::PersonUser.new post["from"]
						post["likes"]["data"].each do |like|
							puts like
							@likes.push Adapter::Facebook::To::Schema::Like.new like
						end
						@likes_count = post["likes"]["count"]
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
