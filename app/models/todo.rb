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
class Todo < ApplicationRecord
  before_create :setDefaults
  validates :title, :body, :dueAt, presence: true
  validates :detailsShowing, :done, inclusion: { in: [true, false] }

  has_many :steps, class_name: :Step, foreign_key: :todo_id, dependent: :destroy

  belongs_to :user, class_name: :User, foreign_key: :user_id

  def setDefaults
    self.detailsShowing = true# if self.detsilsShowing.nil?
    self.done = false
  end
end
