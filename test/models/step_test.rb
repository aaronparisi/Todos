# == Schema Information
#
# Table name: steps
#
#  id         :bigint           not null, primary key
#  done       :boolean
#  row_order  :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  todo_id    :bigint
#
# Indexes
#
#  index_steps_on_todo_id  (todo_id)
#
# Foreign Keys
#
#  fk_rails_...  (todo_id => todos.id)
#
require 'test_helper'

class StepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
