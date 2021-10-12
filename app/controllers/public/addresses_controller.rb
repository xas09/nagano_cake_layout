class Public::AddressesController < ApplicationController
    
def index
    @address = Address.new
    @addresses = Address.all
end

def create
    address = Address.new(address_params)
    address.end_user_id = current_end_user.id
    address.save
    redirect_to addresses_path
end

private

def address_params
    params.require(:address).permit(:zip_code, :address, :name)
end

end
