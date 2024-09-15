class ProductsController < ApplicationController
  def index
    @products = Product.all

    # Filtro por preço mínimo e máximo
    if params[:min_price].present?
      @products = @products.where('price >= ?', params[:min_price].to_f)
    end

    if params[:max_price].present?
      @products = @products.where('price <= ?', params[:max_price].to_f)
    end

    # Filtro por título ou outros campos de texto
    if params[:search].present?
      @products = @products.where('title ILIKE ?', "%#{params[:search]}%")
    end

    # Paginação
    @products = @products.paginate(page: params[:page], per_page: 10)
  end
end