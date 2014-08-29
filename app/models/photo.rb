class Photo < ActiveRecord::Base
  scope :newest_first, -> { order(created_at: :desc) }
  scope :most_recent_five, -> { newest_first.limit(5) }

  def self.created_before(time)
    where("created_at < ?", time)
  end

  def self.next(current_id)
    if (current_id < last.id)
      where("id > ?", current_id).first.id
    else
      current_id
    end
  end

  def self.prev(current_id)
    if (current_id > first.id)
      where("id < ?", current_id).last.id
    else 
      current_id
    end
  end
end
