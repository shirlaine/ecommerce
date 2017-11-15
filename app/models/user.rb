class User < ApplicationRecord

  cattr_accessor :current_user

  has_one :cart
  has_many :cart_items
  has_many :orders


  has_many :orderlines, foreign_key: "user_id", class_name: "Line", through: :orders, source: :line

  has_many :lines, through: :cart_items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :username, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def cart_total_price
    total_price = 0
    get_cart_products.each { |product| total_price += product.price }
    total_price
  end

  def get_cart_products
    current_user.lines
  end

  def purchase_cart_products!
    get_cart_products.each { |product| purchase(product)}
    Cart.destroy(current_user.cart.id)
    CartItem.destroy_all
  end

  def purchase(product)
    lines << product unless purchase?(product)
  end

  def purchase?(product)
    lines.include?(product)
  end

end



