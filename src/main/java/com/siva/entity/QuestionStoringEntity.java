package com.siva.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Setter
@Getter
@Table(name = "questions")
public class QuestionStoringEntity {

	@Id
	@SequenceGenerator(name = "quegen", sequenceName = "questionsgen", initialValue = 100, allocationSize = 1)
	@GeneratedValue(generator = "quegen", strategy = GenerationType.AUTO)
	private Integer questionId;

	@Column(length = 100)
	private String question;

	@Column(length = 50)
	private String option1;

	@Column(length = 50)
	private String option2;

	@Column(length = 50)
	private String option3;

	@Column(length = 50)
	private String option4;
	
	@Column(length = 1)
	private String answer ;

	@Column(length = 20)
	private String questionCategory;
	
	@ManyToOne(fetch = FetchType.EAGER,targetEntity = UserDetails.class)
	@JoinColumn(name = "userId",referencedColumnName = "userId")
	private UserDetails user;
	
	@Override
	public String toString() {
		return "QuestionStoringEntity [questionId=" + questionId + ", question=" + question + ", option1=" + option1
				+ ", option2=" + option2 + ", option3=" + option3 + ", option4=" + option4 + ", answer=" + answer
				+ ", questionCategory=" + questionCategory + "]";
	}
}
