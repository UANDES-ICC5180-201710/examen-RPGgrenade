class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, {presence: true , length: {in: 3..30}}
  validates :last_name, {presence: true , length: {in: 3..30}}
  validates :email, {presence: true , length: {maximum: 50}, uniqueness: true, email: true}
  validates :password, {presence: true, length:{minimum: 8}, confirmation: true}

end
