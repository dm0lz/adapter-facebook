module Writer
  module Adapter
    module Facebook
      module To
        module Schema
          class Post
            attr_reader :source
            def initialize source
              @source = source
            end

          end
        end
      end
    end
  end
end