package com.siva.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.siva.entity.ResultEntity;
import com.siva.entity.UserDetails;
import com.siva.repository.IResultRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class ResultServiceMgmtImpl implements IResutServiceMgmt {

	@Autowired
	private IResultRepository resultRepo;

	@Autowired
	private HttpSession session;

	@Override
	public String saveFeedbackMsg(String saveFeedbackMsg) {
		// TODO
		Integer resultId = (Integer) session.getAttribute("sesResultId");
		Optional<ResultEntity> resultById = resultRepo.findById(resultId);
		ResultEntity resultEntity = resultById.get();
		resultEntity.setExamCount(resultEntity.getExamCount() + 1);
		resultEntity.setUserThoughts(saveFeedbackMsg);
		ResultEntity save = resultRepo.save(resultEntity);
		return "upddated result data is with this Id " + save.getResultId();
	}

	@Override
	public String saveResultEntity(ResultEntity resultEntity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ResultEntity> listOfResultDetails() {
		// TODO Auto-generated method stub
		return resultRepo.findAll()
				.stream()
				.sorted((r1, r2) -> r1.getResultId().compareTo(r2.getResultId()))
				.toList();
	}

	@Override
	public List<ResultEntity> listOfResultsByUser(UserDetails user) {
		// TODO Auto-generated method stub
		return resultRepo.findByUser(user);
	}
	
	@Override
	public String deleteTestResultsById(Integer resultId) {
		// TODO 
		Optional<ResultEntity> resultById = resultRepo.findById(resultId);
		if(resultById.isPresent()) {
		    ResultEntity result = resultById.get();
		    result.setUser(null); // Break the association
		    resultRepo.delete(result); // safer than deleteById when using associations
		    return "Successfully deleted result with ID " + resultId;
		}
		return "Deletion failed! Invalid result ID: " + resultId;
		/*
		Optional<ResultEntity> resultById = resultRepo.findById(resultId);
		if(resultById.isPresent()) {
		    resultRepo.delete(resultById.get());
		    return "Successfully deletion result with ID " + resultId;
		}
		return "Deletion failed! Invalid result ID: " + resultId;*/
	}
	
}
