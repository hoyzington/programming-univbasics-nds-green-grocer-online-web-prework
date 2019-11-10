
def find_item_by_name_in_collection(name, collection)
  i = 0
  while i < collection.size
    if collection[i][:item] == name
      return collection[i]
    end
    i += 1
  end
  return nil
end



def consolidate_cart(cart)
  new_cart = []
  i = 0
  while i < cart.size
    new_cart[i] = cart[i]
    i += 1
  end
  new_cart.uniq!
  i = 0
  while i < new_cart.size
    new_cart[i][:count] = 0
    i += 1
  end
  i = 0
  while i < new_cart.size
    ii = 0
    while ii < cart.size
      if new_cart[i][:item] == cart[ii][:item]
        new_cart[i][:count] += 1
      end
      ii += 1
    end  
    i += 1
  end
  new_cart
end



def apply_coupons(cart, coupons)
  i = 0
  while i < coupons.size
    ii = 0
    while ii < cart.size
      if coupons[i][:item] == cart[ii][:item] and coupons[i][:]
        cart[i][:] += 1
      end
      ii += 1
    end  
    i += 1
  end
  new_cart
  
  # REMEMBER: This method **should** update cart
  
end



def apply_clearance(cart)
  
  # REMEMBER: This method **should** update cart
  
end



def checkout(cart, coupons)
  counted_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(counted_cart, coupons)
  clearance_cart = apply_clearance(coupon_cart)
  
  # This method should call: consolidate_cart, apply_coupons, apply_clearance
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers)
  
end
