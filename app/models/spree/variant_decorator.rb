Spree::Variant.class_eval do

  include ActionView::Helpers::NumberHelper

  def to_hash
    actual_price  = self.orig_price_in(Spree::Config[:currency]).money
    sale_price = self.sale_price ? self.price_in(Spree::Config[:currency]).money : nil

    #actual_price += Calculator::Vat.calculate_tax_on(self) if Spree::Config[:show_price_inc_vat]
    {
      :id    => self.id,
      :in_stock => self.in_stock?,
      :price => actual_price,
      :sale_price => sale_price
    }
  end

end
