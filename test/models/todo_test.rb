# == Schema Information
#
# Table name: todos
#
#  id             :bigint           not null, primary key
#  body           :string           not null
#  completedAt    :datetime
#  detailsShowing :boolean          default(TRUE), not null
#  done           :boolean          default(FALSE), not null
#  dueAt          :datetime         not null
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint
#
# Indexes
#
#  index_todos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
