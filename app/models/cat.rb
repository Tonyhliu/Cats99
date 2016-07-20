class Cat < ActiveRecord::Base
  COLORS = ["Red", "Blue", "Yellow", "Orange", "Green", "Purple", "Black"]

  validates :color, inclusion: { :in => COLORS }
  validates :sex, inclusion: { :in => ["F", "M"] }
  validates :name, :color, :birth_date, :description, presence: true
  # validates :name, integer: false

  def age
    year = Date.today.year - self.birth_date.year
    "over #{year} years"
  end

  has_many :cat_rentals,
    class_name: 'CatRental',
    primary_key: :id,
    foreign_key: :cat_id

end
