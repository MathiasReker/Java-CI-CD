package com.example.cicd.controller;

import com.example.cicd.model.Demo;
import com.example.cicd.repository.DemoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class DemoController {

  @Autowired DemoRepository demoRepository;

  @GetMapping("/")
  public String helloWorld() {
    return "Hello World";
  }

  @GetMapping("/demo")
  public List<Demo> getAllDemoMessages() {
    return demoRepository.findAll();
  }
}
