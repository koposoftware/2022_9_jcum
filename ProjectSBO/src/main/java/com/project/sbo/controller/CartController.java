package com.project.sbo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.sbo.util.FoodPriceCalc;
import com.project.sbo.vo.Cart;
import com.project.sbo.vo.CartList;

@Controller
public class CartController {
	
	@ResponseBody
	@PostMapping("/addCart")
	public CartList addCart(Cart cart, long storeId, String storeName, int deleveryTip, HttpSession session) {
 
		// 세션에 저장된 cartList 불러옴
		CartList cartList = (CartList) session.getAttribute("cartList");
		
		int totalPrice = FoodPriceCalc.foodPriceCalc(cart);
		
		if(cartList == null) {
			List<Cart> newCart = new ArrayList<>();
			cart.setTotalPrice(totalPrice);
			newCart.add(cart);
			cartList = new CartList(storeId, storeName, totalPrice, deleveryTip, newCart);
		}
		// 기존에 담긴 상품중 같은 상품이 있다면 수량만 증가시켜야 되니까 세션으로 처리
		else {
			List<Cart> prevCart = cartList.getCart();
			int prevCartTotal = cartList.getCartTotal();
			cartList.setCartTotal(prevCartTotal + totalPrice);
		
			if(prevCart.contains(cart)) {
				int cartIndex = prevCart.indexOf(cart);
				int amount = cart.getAmount();
				
				Cart newCart = prevCart.get(cartIndex);
				int newAmount = newCart.getAmount() + amount;
				int newTotal = newCart.getTotalPrice() + totalPrice;
				
				newCart.setAmount(newAmount);
				newCart.setTotalPrice(newTotal);
				prevCart.set(cartIndex, newCart);
			} else {
				cart.setTotalPrice(totalPrice);
				prevCart.add(cart);
			}
		}
		
		session.setAttribute("cartList", cartList);
 
		return cartList;
	}
	
	// 새로고침해도 장바구니 정보 그대로 유지하기
	// 가게 처음 들어왔을때 화면에 보여줄 cartList 메서드, storeDetail.js 의 부분과 연동
	// 장바구니 담긴 내역을 들고오는것
	@ResponseBody
	@GetMapping("/cartList")
	public CartList cartList(HttpSession session) {
		CartList cartList = (CartList) session.getAttribute("cartList");
		if (cartList != null) {
			return cartList;
		}
		return null;
	}
	
	// 장바구미 메뉴전체삭제와 1개 삭제부분
	@ResponseBody
	@DeleteMapping("/cartAll")
	public void deleteAllCart(HttpSession session) {
		session.removeAttribute("cartList");
	}
 
	@ResponseBody
	@DeleteMapping("/cartOne")
	public CartList deleteOneCart(HttpSession session, int index) {
		CartList cartList = (CartList) session.getAttribute("cartList");
		if (cartList == null) {
			return null;
		}
		int cartTotal = cartList.getCartTotal();
		List<Cart> cart = cartList.getCart();
		int removeCartPrice = cart.get(index).getTotalPrice();
		
		cart.remove(index);
		
		if(cart.size() == 0) {
			session.removeAttribute("cartList");
			return null;
		}
		
		cartTotal -=  removeCartPrice;
		cartList.setCartTotal(cartTotal);
		return cartList;
	}
	
	// 추가로 수량 변경처리
	@ResponseBody
	@PatchMapping("/cartAmount")
	public CartList cartAmount(int cartNum, String clickBtn, HttpSession session) {
	    CartList cartList = (CartList) session.getAttribute("cartList");
	    List<Cart> cart = cartList.getCart();
	    
	    Cart prevCart = cart.get(cartNum);
	    
	    int amount = prevCart.getAmount();
	    int foodPrice = prevCart.getTotalPrice() / amount;
	    int total = cartList.getCartTotal() - prevCart.getTotalPrice();
	    
	    if(clickBtn.equals("plus")) {
	        amount++;
	        foodPrice = foodPrice * amount;
	        
	        prevCart.setAmount(amount);
	        prevCart.setTotalPrice(foodPrice);
	        
	    } else {
	        if (amount <= 1) {
	            return cartList;
	        }
	        amount--;
	        foodPrice = foodPrice * amount;
	        
	        prevCart.setAmount(amount);
	        prevCart.setTotalPrice(foodPrice);
	    }
	    
	    cartList.setCartTotal(total + foodPrice);
	    cart.set(cartNum, prevCart);
	    
	    return cartList;
	}


 
}