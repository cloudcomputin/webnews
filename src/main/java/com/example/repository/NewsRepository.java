package com.example.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.model.News;
import java.util.List;

@Repository
public interface NewsRepository extends CrudRepository<News, Integer> {
	
}
