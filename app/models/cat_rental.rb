class CatRental < ActiveRecord::Base
  STATUS = ["DENIED", "APPROVED"]

  validates :status, inclusion: { :in => STATUS }
  validates :cat_id, :status, :start_date, :end_date, presence: true

  belongs_to :cat,
    class_name: 'Cat',
    foreign_key: :cat_id,
    primary_key: :id

  def overlapping_requests 
    CatRental.
      where.not(id: self.id)
      .where(cat_id: cat_id)
      .where(<<- start_date: start_date, end_date: end_date)
  end

  def overlapping_approved_requests

  end

end
