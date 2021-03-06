package com.parking.dao;

import java.text.DecimalFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parking.vo.Review;

@Repository
public class ReviewListDAOMysql {
	
	@Autowired
	public SqlSession session;
	
	public List<Review> selecyByParkingCode(int review_parking_code){
		return session.selectList("ReviewMapper.selectByCodeRe", review_parking_code);
	}
	
	public boolean updateReviewDeclaration(Review r){
		int result = session.update("ReviewMapper.updateDeclaration", r);
		if(result ==1 ){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean insertByReview(Review r) {
		int result = session.insert("ReviewMapper.insertByReview", r);
		if(result>0){
			return true;
		}else{
			return false;
		}
	}
	
	public String selectAvg(Review r){
		try{
			double result = session.selectOne("ReviewMapper.selectAvg", r);
			DecimalFormat df = new DecimalFormat("#.#");
			return df.format(result);			
		}catch (NullPointerException e) {
			return "0.0";
		}
	}
}
