package kr.spring.food.vo;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class F_cartVO {				//논리명					키 분류
	@NotEmpty
	private int cart_num;			//장바구니번호				PK
	@NotEmpty
	private int food_num;			//식품번호					FK
	@NotEmpty
	private int mem_num;			//회원번호					FK
	private int f_cart_quantity;	//장바구니수량
	private int f_cart_price;		//장바구니가격
}
