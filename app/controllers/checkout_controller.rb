class CheckoutController < ApplicationController
  def new
    session[:cart] ||= {}
    @cart_items = Product.find(session[:cart].keys).map do |product|
      {
        product: product,
        quantity: session[:cart][product.id.to_s]
      }
    end

    @provinces = Province.order(:name)

    @subtotal = @cart_items.sum { |item| item[:product].price * item[:quantity] }

    selected_province = Province.find_by(id: params[:province_id])

    if selected_province
      @gst_amount = (@subtotal * selected_province.gst_rate).round(2)
      @pst_amount = (@subtotal * selected_province.pst_rate).round(2)
      @hst_amount = (@subtotal * selected_province.hst_rate).round(2)
    else
      @gst_amount = 0
      @pst_amount = 0
      @hst_amount = 0
    end

    @total = (@subtotal + @gst_amount + @pst_amount + @hst_amount).round(2)
  end

  def create
    session[:cart] ||= {}

    user = User.find_or_initialize_by(email: params[:email])
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.address = params[:address]
    user.city = params[:city]
    user.postal_code = params[:postal_code]
    user.province_id = params[:province_id]

    if user.new_record?
      random_password = SecureRandom.hex(8)
      user.password = random_password
      user.password_confirmation = random_password
    end

    unless user.save
      redirect_to checkout_path, alert: "Could not save checkout information."
      return
    end

    province = Province.find(user.province_id)

    cart_items = Product.find(session[:cart].keys).map do |product|
      {
        product: product,
        quantity: session[:cart][product.id.to_s]
      }
    end

    subtotal = cart_items.sum { |item| item[:product].price * item[:quantity] }
    gst_amount = (subtotal * province.gst_rate).round(2)
    pst_amount = (subtotal * province.pst_rate).round(2)
    hst_amount = (subtotal * province.hst_rate).round(2)
    total = (subtotal + gst_amount + pst_amount + hst_amount).round(2)

    order = user.orders.create!(
      subtotal: subtotal,
      gst_amount: gst_amount,
      pst_amount: pst_amount,
      hst_amount: hst_amount,
      total: total,
      status: "pending"
    )

    cart_items.each do |item|
      order.order_items.create!(
        product: item[:product],
        quantity: item[:quantity],
        price_at_purchase: item[:product].price
      )
    end

    session[:cart] = {}

    redirect_to order_path(order), notice: "Order placed successfully."
  end
end