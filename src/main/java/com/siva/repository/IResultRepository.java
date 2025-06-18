package com.siva.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.siva.entity.ResultEntity;
import com.siva.entity.UserDetails;


public interface IResultRepository extends JpaRepository<ResultEntity, Integer>  {
	/*
		@Query("SELECT q.answer FROM QuestionStoringEntity q WHERE q.id = :qid")
		public String findByAnswer(@Param("qid") Integer qid);
		
		
		@Query(value = "select from result_details where category= :category and user_id =:userId ")*/
	
	public ResultEntity findByCategoryAndUser(String category,UserDetails user);
   
	public List<ResultEntity>  findByUser(UserDetails user);
	
}
