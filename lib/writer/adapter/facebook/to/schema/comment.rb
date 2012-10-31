module Writer
  module Adapter
    module Facebook
      module To
        module Schema
          class Comment
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