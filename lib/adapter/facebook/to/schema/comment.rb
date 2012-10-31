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
					attribute :likesCount
					attribute :createdTime

					def initialize comments
						@_type = "http://schema.org/UserComments"
						coerce comments
					end

					def coerce comment
						@id = comment["id"]
						@author = Adapter::Facebook::To::Schema::PersonUser.new(comment["from"])
						@text = comment["message"]
						@likesCount = comment["likes"]
						@createdTime = comment["created_time"]
					end
					
					def equals comment
						@id == comment.id and @author == comment.author and @text == comment.text and @likes == comment.likes
					end
				end
			end
		end
	end
end
