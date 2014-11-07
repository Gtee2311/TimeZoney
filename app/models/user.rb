class User < ActiveRecord::Base
    has_secure_password
    
    validates :name, presence: true
    validates :email, presence: true
    validates_format_of :email, :with => /\A\S+@\S+\.\S+\z/
    validates :password, length: { minimum: 6 }, allow_blank: true
    
    has_many :timezone
    
    accepts_nested_attributes_for :timezone
    
end
