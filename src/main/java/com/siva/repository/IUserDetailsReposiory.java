package com.siva.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.siva.entity.UserDetails;



public interface IUserDetailsReposiory
                              extends JpaRepository<UserDetails, Integer> 
{
    public UserDetails findByUserEmail(String email);
    
    public UserDetails findByUserEmailAndUserPassword(String umail, String pasword);
    
	/*@Query(value = "select state_name from india_states where country_id=1",nativeQuery = true)
	public List<String> listOfIndiaStates();
	*/
}
