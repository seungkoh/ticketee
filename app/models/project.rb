class Project < ActiveRecord::Base
  # Commented out following option from name field validation because it gives me "Validation failed: Name has already been taken" error: :uniqueness => true
  validates :name, :presence => true
  has_many :tickets, :dependent => :delete_all
  has_many :permissions, :as => :thing
  scope :readable_by, lambda { |user|
    joins(:permissions).where(:permissions => { :action => "view", :user_id => user.id })
  }
  
  def self.for(user)
    user.admin? ? Project : Project.readable_by(user)
  end
end
