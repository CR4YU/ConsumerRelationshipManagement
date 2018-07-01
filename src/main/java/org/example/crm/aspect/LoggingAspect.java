package org.example.crm.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

@Aspect
@Component
public class LoggingAspect {

	private static final Logger logger = LogManager.getLogger(LoggingAspect.class);


	@Pointcut("execution(* org.example.crm.controller.*.*(..))")
	private void controllerPackage() {}

	@Pointcut("execution(* org.example.crm.service.*.*(..))")
	private void servicePackage() {}

	@Pointcut("execution(* org.example.crm.dao.*.*(..))")
	private void daoPackage() {}

	@Pointcut("controllerPackage() || servicePackage() || daoPackage()")
	private void appFlow() {}


	@Before("appFlow()")
	public void before(JoinPoint joinPoint) {
		String method = joinPoint.getSignature().toShortString();

		logger.info("### @Before ###. Calling method: " + method);
	}

	@AfterReturning(pointcut = "appFlow()", returning = "result")
	public void afterReturning(JoinPoint joinPoint, Object result) {
		logger.info("### @AfterReturning ###. Method: " +
				joinPoint.getSignature().toShortString() + "Result: " + result);
	}
}
