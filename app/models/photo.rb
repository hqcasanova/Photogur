class Photo < ActiveRecord::Base
  scope :newest_first, -> { order(created_at: :desc) }
  scope :most_recent_five, -> { newest_first.limit(5) }

  def self.created_before(time)
    where("created_at < ?", time)
  end

  def next
    if (id < Photo.last.id)
      Photo.where("id > ?", id).first.id
    else
      id
    end
  end

  def prev
    if (id > Photo.first.id)
      Photo.where("id < ?", id).last.id
    else 
      id
    end
  end
end
