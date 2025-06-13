package com.siva.runner;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;

import com.siva.entity.UserDetails;
import com.siva.repository.IQuestionStroringRepository;
import com.siva.repository.IUserDetailsReposiory;
import com.siva.services.IQuestionStoringServicesMgmt;

//@Component
public class QuestionStoringRunner implements CommandLineRunner {
	
	@Autowired
	private IQuestionStoringServicesMgmt questionService;
	
	@Autowired
	private IQuestionStroringRepository repo;
	
	@Autowired
	private IUserDetailsReposiory userRepo;
	@Override
	public void run(String... args) throws Exception {
//		repo.findByQuestionCategory("Java").forEach(System.out::println);
		// TODO Auto-generated method stub
		/*
		QuestionStoringEntity qse1 = new QuestionStoringEntity(null, 
		        "Which planet is known as the Red Planet?", 
		        "Earth", 
		        "Mars", 
		        "Jupiter", 
		        "Venus");
		
		QuestionStoringEntity qse2 = new QuestionStoringEntity(null, 
		        "What is the largest ocean on Earth?", 
		        "Atlantic Ocean", 
		        "Indian Ocean", 
		        "Arctic Ocean", 
		        "Pacific Ocean");
		
		QuestionStoringEntity qse3 = new QuestionStoringEntity(null, 
		        "Who wrote the play 'Romeo and Juliet'?", 
		        "Leo Tolstoy", 
		        "William Shakespeare", 
		        "Charles Dickens", 
		        "Mark Twain");
		
		QuestionStoringEntity qse4 = new QuestionStoringEntity(null, 
		        "What is the boiling point of water at sea level in Celsius?", 
		        "90°C", 
		        "100°C", 
		        "110°C", 
		        "120°C");
		
		QuestionStoringEntity qse5 = new QuestionStoringEntity(null, 
		        "Which element has the chemical symbol 'O'?", 
		        "Osmium", 
		        "Oxygen", 
		        "Gold", 
		        "Silver");
		
		String q1 = questionService.saveQuestion(qse1);
		String q2 = questionService.saveQuestion(qse2);
		String q3 = questionService.saveQuestion(qse3);
		String q4 = questionService.saveQuestion(qse4);
		String q5 = questionService.saveQuestion(qse5);
		 
		System.out.println("\033[1;31m"+q1
				+", "+q2
				+" , "+ q3
				+ ", "+q4
				+ ", "+q5
				+ ".\033[1;0m");
		
		questionService.setOfQuestion()
		.forEach(que->{
			System.out.println("\033[1;34m"+que+"\033[1;0m");
		});
		*/
		
		Optional<UserDetails> opt = userRepo.findById(23);
		repo.findQuestionByUser(opt.get()).forEach(System.out::println);

		

	}

}
