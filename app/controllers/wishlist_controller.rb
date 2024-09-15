class WishlistController < ApplicationController
  def index
  end
end
class WishlistController < ApplicationController
  before_action :set_product, only: [:add_to_wishlist]

  def index
    @wishlist_items = WishlistItem.all # Carrega todos os itens da wishlist
  end

  def add_to_wishlist
    wishlist_item = WishlistItem.new(product: @product)

    if wishlist_item.save
      redirect_to wishlist_path, notice: 'Produto adicionado à wishlist com sucesso.'
    else
      redirect_to products_path, alert: 'Não foi possível adicionar o produto à wishlist.'
    end
  end

  def remove_from_wishlist
    wishlist_item = WishlistItem.find(params[:id])

    if wishlist_item.destroy
      redirect_to wishlist_path, notice: 'Produto removido da wishlist com sucesso.'
    else
      redirect_to wishlist_path, alert: 'Não foi possível remover o produto da wishlist.'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
