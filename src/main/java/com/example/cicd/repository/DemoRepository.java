package com.example.cicd.repository;

import com.example.cicd.model.Demo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DemoRepository extends JpaRepository<Demo, Long> {}
