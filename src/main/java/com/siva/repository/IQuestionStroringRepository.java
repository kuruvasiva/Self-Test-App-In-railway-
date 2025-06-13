package com.siva.repository;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.siva.entity.QuestionStoringEntity;
import com.siva.entity.UserDetails;

public interface IQuestionStroringRepository extends JpaRepository<QuestionStoringEntity, Integer> {
	 
		@Query("SELECT q.answer FROM QuestionStoringEntity q WHERE q.id = :qid")
		public String findByAnswer(@Param("qid") Integer qid);
		
		public Set<QuestionStoringEntity> findByQuestionCategory(String category);
		
		public Set<QuestionStoringEntity> findQuestionByUser(UserDetails user);
}
