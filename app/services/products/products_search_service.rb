# frozen_string_literal: true

module Products
  class ProductsSearchService
    def initialize(params)
      @params = params
    end

    def call
      products = Product.all

      if @params[:name].present?
        products = products.where('name ILIKE ?', "%#{@params[:name]}%")
      end

      if @params[:min_price].present?
        products = products.where('price >= ?', @params[:min_price])
      end

      if @params[:max_price].present?
        products = products.where('price <= ?', @params[:max_price])
      end

      if @params[:created_at].present?
        products = products.where('DATE(created_at) = ?', @params[:created_at])
      end

      products
    end
  end
end
