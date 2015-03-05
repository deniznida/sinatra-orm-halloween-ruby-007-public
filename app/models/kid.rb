class Kid < ActiveRecord::Base
  has_one :bucket
  has_many :candies, through: :bucket

  def pig_out(amount)
    amount.to_i.times do
      self.bucket.candies.last.destroy
    end
    if amount.to_i <= 2
      self.feeling = "Happy"
    elsif amount.to_i >= 3
      self.feeling = "Sick"
    end
    self.save
  end
end