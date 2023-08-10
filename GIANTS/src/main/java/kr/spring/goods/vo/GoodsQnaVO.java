package kr.spring.goods.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GoodsQnaVO {
	private int qna_num;
	private String qna_title;
	private String qna_content;
	private Date qna_regdate;
	private Date qna_mdate;
	private int qna_status; //1:답변전, 2:답변완료
	private int mem_num;
	private int goods_num;
	private String qna_ip;
	
	private String id;
	private String goods_name;
}