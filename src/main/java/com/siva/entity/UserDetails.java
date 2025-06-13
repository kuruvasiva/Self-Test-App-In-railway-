package com.siva.entity;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "UserDetails")
public class UserDetails {

	@Id
	@SequenceGenerator(name = "gen1", sequenceName = "UD_Seq", initialValue = 1, allocationSize = 1)
	@GeneratedValue(generator = "gen1", strategy = GenerationType.IDENTITY)
	private Integer userId;
	@Column(length = 30)
	private String userName;

	@Column(unique = true, length = 50)
	private String userEmail;

	private Long userPhno;
	@Column(length = 30)
	private String userPassword;

	@Column(length = 50)
	private String userLocation;

	@Column(length = 30)
	private String usagePurpose;

	 private boolean userActive;

	@CreationTimestamp
	@Column(insertable = true, updatable = false)
	private LocalDateTime openingDate;

	@UpdateTimestamp
	@Column(insertable = false, updatable = true)
	private LocalDateTime lostlyOpened;
	

	@Column(length = 15)
	private String UserRole; // Values: "FRESHER", "WORKER", "STUDENT"
	/*
	@Lob // oracle
	@Column(name = "UserImage")
	private byte[] profileImage;
	*/
	
	@Lob // MySql database
	@Column(name = "UserImage", columnDefinition = "MEDIUMBLOB")
	private byte[] profileImage;
	

	@OneToMany(mappedBy = "user",cascade = CascadeType.ALL,targetEntity = QuestionStoringEntity.class,fetch = FetchType.EAGER)
	private List<QuestionStoringEntity> listOfQues;


	@Override
	public String toString() {
		return "UserDetails [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPhno="
				+ userPhno + ", userPassword=" + userPassword + ", userLocation=" + userLocation + ", usagePurpose="
				+ usagePurpose + ", userActive=" + userActive + ", openingDate=" + openingDate + ", lostlyOpened="
				+ lostlyOpened + ", UserRole=" + UserRole + ", profileImage=" + Arrays.toString(profileImage) + "]";
	}
	

	

}
