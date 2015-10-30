class VendorsController < ApplicationController
    def show
        @vendors = Vendor.all
    end
end
