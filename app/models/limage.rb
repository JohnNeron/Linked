class Limage < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
