package com.siva.services;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siva.entity.QuestionStoringEntity;
import com.siva.entity.ResultEntity;
import com.siva.entity.UserDetails;
import com.siva.repository.IQuestionStroringRepository;
import com.siva.repository.IResultRepository;
import com.siva.repository.IUserDetailsReposiory;

import jakarta.servlet.http.HttpSession;

@Service
public class QuestionStoringServiceMgmtImpl implements IQuestionStoringServicesMgmt {

	@Autowired
	private IQuestionStroringRepository questionSRepo;

	@Autowired
	private IUserDetailsReposiory userRepo;

	@Autowired
	private IResultRepository resultRepo;

	@Autowired
	private HttpSession session;

	@Override
	public String saveQuestion(QuestionStoringEntity questionStoringEntity) {
		// TODO Auto-generated method stub
		Integer userId = (Integer) session.getAttribute("sessionId");
		Optional<UserDetails> byId = userRepo.findById(userId);

		byId.get().setListOfQues(List.of(questionStoringEntity));
		questionStoringEntity.setUser(byId.get());
		Integer questionId = questionSRepo.save(questionStoringEntity).getQuestionId();

		return "Successfully inserted the question in databse with this Id " + questionId;
	}

	@Override
	public Set<QuestionStoringEntity> setOfQuestion() {
		// TODO Auto-generated method stub

		/*Set<QuestionStoringEntity> sortedSet = questionSRepo.findAll().stream().collect(Collectors
				.toCollection(() -> new TreeSet<>(Comparator.comparing(QuestionStoringEntity::getQuestionId))));
		*/
		Set<QuestionStoringEntity> sortedSet = questionSRepo.findAll().stream().distinct().collect(Collectors.toSet());
		return sortedSet;
	}

	@Override
	public Set<QuestionStoringEntity> setOfQuestionBYCategory(String categoryName) {
		//
		Set<QuestionStoringEntity> questionsByCategory = questionSRepo.findByQuestionCategory(categoryName);
		if (questionsByCategory.isEmpty()) {
			
			return null;
		}
		ResultEntity resultbyCategory = resultRepo.findByCategory(categoryName);
		if (resultbyCategory == null) {
			Integer userId = (Integer) session.getAttribute("sessionId");
			Optional<UserDetails> userFindIyId = userRepo.findById(userId);
			ResultEntity newResults = new ResultEntity();
			newResults.setCategory(categoryName);
			newResults.setUser(userFindIyId.get());
			resultRepo.save(newResults);// result save
			session.setAttribute("sesResultId", newResults.getResultId());
			return questionsByCategory;
		}
		session.setAttribute("sesResultId", resultbyCategory.getResultId());
		return questionsByCategory;

	}

	@Override
	public String testResults(Map<Integer, String> map) {

		Integer resultId = (Integer) session.getAttribute("sesResultId");
		Optional<ResultEntity> resultById = resultRepo.findById(resultId);

		if (resultById.isPresent()) {
			Integer correctAns = 0;

			for (Map.Entry<Integer, String> loopMap : map.entrySet()) {

				String databaseAns = questionSRepo.findByAnswer(loopMap.getKey());

				if (databaseAns.equalsIgnoreCase(loopMap.getValue()) && databaseAns != null) {
					correctAns++;
				}
			}
			Integer totalCount = map.size(); // only count questions answered
			double percentage = ((double) correctAns / totalCount) * 100;
			double roundedPercentage = Math.round(percentage * 100.0) / 100.0;

			ResultEntity resultEntity = resultById.get();
			resultEntity.setQuestionsAttempted(totalCount);
			resultEntity.setCorrectAnswers(correctAns);
			resultEntity.setResultPercentage(roundedPercentage);
			resultRepo.save(resultEntity);

			session.setAttribute("percentage", "Per ::" + roundedPercentage + " %");
			return "<div style='color:gray;'>Your correct answers : <i style='color:#0f9b0f;'>" + correctAns
					+ "</i><br/>Your score: <b style='color:blue;'>" + String.format("%.2f", roundedPercentage)
					+ "%</b>" + "<br>Wrong answers: <b style='color:red;'>" + (totalCount - correctAns) + "</b></div>";

		}
		return "Result Id Is Invalid " + resultId;
	}

	@Override
	public List<Integer> saveAll(List<QuestionStoringEntity> listOfQusetions) {
		// TODO Auto-generated method stub
		Integer userId = (Integer) session.getAttribute("sessionId");

		Optional<UserDetails> byId = userRepo.findById(userId);
		if (byId.isPresent()) {

			byId.get().setListOfQues(listOfQusetions);
			listOfQusetions.forEach(question -> question.setUser(byId.get())); // set user to questions

			List<Integer> listIst = questionSRepo.saveAll(listOfQusetions).stream().map(t -> t.getQuestionId())
					.toList();

			return listIst;
		}

		return null;

	}

	@Override
	public QuestionStoringEntity findByQseByInteger(Integer questionId) {
		// TODO Auto-generated method stub
		return questionSRepo.findById(questionId)
				.orElseThrow(() -> new IllegalArgumentException("In valid questionId entered"));
	}

	@Override
	public String updateQseById(QuestionStoringEntity qse) {
		// TODO
		Optional<QuestionStoringEntity> optional = questionSRepo.findById(qse.getQuestionId());
		/*Integer userId = (Integer) session.getAttribute("sessionId");
		
		Optional<UserDetails> byId = userRepo.findById(userId);
		*/
		if (optional.isPresent()) {

			QuestionStoringEntity save = questionSRepo.save(qse);

			return "Successfully updated the question in databse " + qse.getQuestionId() + " & UserId :"
					+ save.getUser().getUserId();
		}
		return "Not updated!, beacause Invalid quedtionId Or Invalid UserId";
	}

	@Override
	public String deleteQseByQuestionId(Integer qseId) {
		// TODO Auto-generated method stub

		Optional<QuestionStoringEntity> optional = questionSRepo.findById(qseId);
		if (optional.isPresent()) {
			optional.get().setUser(null);
			questionSRepo.deleteById(qseId);
			return "Successfully deleted the question in databse this Id " + qseId;
		}
		return "Not deleted!, beacause Invalid Id";
	}

	@Override
	public Set<QuestionStoringEntity> setOfQuestionBYUser() {
		// TODO Auto-generated method stub
		Integer userId = (Integer) session.getAttribute("sessionId");
		Optional<UserDetails> opt = userRepo.findById(userId);
		if (opt.isPresent()) {
			return questionSRepo.findQuestionByUser(opt.get());
		}
		return Set.of();
	}

}
