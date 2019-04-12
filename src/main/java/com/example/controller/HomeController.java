package com.example.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.service.CategoryNewsService;
import com.example.service.NewsService;

@Controller
public class HomeController {
	@Autowired
	private CategoryNewsService categoryNewsService;
	@Autowired
	private NewsService newsService;
	
	@GetMapping("/news")
	public String home(ModelMap model) throws IOException
	{
		model.put("catenews", categoryNewsService.findAll());
		model.put("newss", newsService.findAll());
		return "home";
	}
	
}
