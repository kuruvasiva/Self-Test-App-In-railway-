package com.siva.services;

import java.util.List;

import com.siva.entity.ResultEntity;
import com.siva.entity.UserDetails;

public interface IResutServiceMgmt {

	public String saveFeedbackMsg(String saveFeedbackMsg);
	
	public String saveResultEntity(ResultEntity resultEntity);
	
	public List<ResultEntity> listOfResultDetails();
	
	public List<ResultEntity> listOfResultsByUser(UserDetails user);
	
	public String deleteTestResultsById(Integer resultId);
}
