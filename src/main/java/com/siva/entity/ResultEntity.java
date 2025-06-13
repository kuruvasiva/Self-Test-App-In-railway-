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
import jakarta.persistence.Version;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Entity
@Setter
@Getter
@Table(name = "ResultDetails")
public class ResultEntity {

	@Id
	@SequenceGenerator(name = "resgen", sequenceName = "Resultgen", initialValue = 1, allocationSize = 1)
	@GeneratedValue(generator = "resgen", strategy = GenerationType.AUTO)
	private Integer resultId;

	private Double resultPercentage;

	private Integer questionsAttempted;

	private Integer correctAnswers;

	@Column(length = 20)
	private String category;
	@Column(length = 200)
	private String userThoughts;

	private Integer examCount;

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = UserDetails.class)
	@JoinColumn(name = "userId", referencedColumnName = "userId")
	private UserDetails user;

	@Override
	public String toString() {
		return "ResultEntity [resultId=" + resultId + ", resultPercentage=" + resultPercentage + ", category="
				+ category + ", userThoughts=" + userThoughts + "]";
	}

}
