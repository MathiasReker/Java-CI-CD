package com.example.cicd;

import com.example.cicd.model.Demo;
import com.example.cicd.repository.DemoRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.util.List;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class CiCdItTests {

  @Autowired DemoRepository demoRepository;

  @BeforeEach
  void beforeEach() {
    Demo demo = new Demo();
    demo.setMessage("This is a test");
    demoRepository.save(demo);
  }

  @Test
  void demoTest() {
    List<Demo> demo = demoRepository.findAll();
    Assertions.assertEquals(1, demo.size());
  }
}
