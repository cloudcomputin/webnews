package com.example.service;

import com.example.model.News;

import java.util.List;

public interface NewsService {
	Iterable<News> findAll();
	
	News findOne(Integer id);
	
	void saveNews(News n);
	
	void deleteNews(Integer id);
}
