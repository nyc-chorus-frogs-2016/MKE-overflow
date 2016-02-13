class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, through: :question_tags
end
  def sort_tags(tags)
    sort_array= tags.sort_by do |tag|
      tag.questions.count
    end
    sort_array.reverse!
  end


