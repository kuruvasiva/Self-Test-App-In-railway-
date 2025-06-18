package com.siva.services;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.siva.entity.QuestionStoringEntity;

public interface IQuestionStoringServicesMgmt {

	public String saveQuestion(QuestionStoringEntity questionStoringEntity);

	public Set<QuestionStoringEntity> setOfQuestion();
	
	//public String testResults(List<Integer> lisOfQids,List<String> listOfAns);

	public String testResults(Map<Integer, String> checkMap);

	public List<Integer> saveAll(List<QuestionStoringEntity> listOfQusetions);

	public QuestionStoringEntity findByQseByInteger(Integer questionId);
	
	public String updateQseById(QuestionStoringEntity qse);
	
	public String deleteQseByQuestionId(Integer qseId);
	
	public  Set<QuestionStoringEntity> setOfQuestionBYUser();
	
	public  Set<QuestionStoringEntity> setOfQuestionBYCategory(String categoryName,Integer UserId);
}
