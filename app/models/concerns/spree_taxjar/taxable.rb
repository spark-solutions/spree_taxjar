module SpreeTaxjar
  module Taxable
    extend ActiveSupport::Concern

    private

    def taxjar_applicable?(order)
      ::Spree::TaxRate.joins(:calculator)
                      .match(order.tax_zone)
                      .where(spree_calculators: { type: ::Spree::Calculator::TaxjarCalculator.to_s }  )
                      .any?
    end
  end
end

