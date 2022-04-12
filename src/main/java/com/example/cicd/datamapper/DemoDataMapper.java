package com.example.cicd.datamapper;

import com.example.cicd.model.Demo;
import com.example.cicd.repository.DemoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DemoDataMapper implements CommandLineRunner {

  @Autowired DemoRepository demoRepository;

  @Override
  public void run(String... args) throws Exception {

    Demo demo = new Demo();
    demo.setMessage("hello");
    demoRepository.save(demo);
  }
}
