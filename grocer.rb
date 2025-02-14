
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
      if coupons[i][:item] == cart[ii][:item] and coupons[i][:num] <= cart[ii][:count]
        cart << {item: "#{cart[ii][:item]} W/COUPON", price: coupons[i][:cost]/coupons[i][:num], clearance: cart[ii][:clearance], count: cart[ii][:count]-cart[ii][:count].modulo(coupons[i][:num])}
        cart[ii][:count] -= cart.last[:count]
      end
      ii += 1
    end  
    i += 1
  end
  cart
end


def apply_clearance(cart)
  i = 0
  while i < cart.size
    if cart[i][:clearance] == true
      cart[i][:price] *= 0.8
      cart[i][:price] = cart[i][:price].round(2)
    end
    i += 1
  end
  cart
end


def checkout(cart, coupons)
  counted_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(counted_cart, coupons)
  clearance_cart = apply_clearance(coupon_cart)
  clearance_cart
  total = 0
  i = 0
  while i < clearance_cart.size
    total += clearance_cart[i][:price]*clearance_cart[i][:count]
    i += 1
  end
  if total > 100
    total *= 0.9
    total.round(2)
  end
  total
end
