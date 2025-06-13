package com.siva.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.siva.entity.ResultEntity;
import com.siva.entity.UserDetails;


public interface IResultRepository extends JpaRepository<ResultEntity, Integer>  {

	public ResultEntity findByCategory(String category);
   
	public List<ResultEntity>  findByUser(UserDetails user);
	
}
