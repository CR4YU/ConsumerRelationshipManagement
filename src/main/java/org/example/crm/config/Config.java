package org.example.crm.config;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.Properties;

@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan("org.example.crm")
@PropertySource("classpath:persistence.properties")
public class Config implements WebMvcConfigurer {

	@Autowired
	private Environment env;

	@Bean
	public ViewResolver viewResolver() {

		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();

		viewResolver.setPrefix("/WEB-INF/jsp/");
		viewResolver.setSuffix(".jsp");

		return viewResolver;
	}

	@Bean
	public DataSource dataSource() {

		BasicDataSource dataSource = new BasicDataSource();

		dataSource.setDriverClassName(env.getProperty("jdbc.driver"));
		dataSource.setUrl(env.getProperty("jdbc.url"));
		dataSource.setUsername(env.getProperty("jdbc.username"));
		dataSource.setPassword(env.getProperty("jdbc.password"));

		dataSource.setInitialSize(intProperty("conn.initialSize"));
		dataSource.setMaxActive(intProperty("conn.maxActive"));
		dataSource.setMaxIdle(intProperty("conn.maxIdle"));

		return dataSource;
	}

	private Properties hibernateProperties() {

		Properties props = new Properties();

		props.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
		props.setProperty("hibernate.show_sql", env.getProperty("hibernate.show_sql"));

		return props;
	}

	private int intProperty(String propName) {
		return Integer.parseInt(env.getProperty(propName));
	}

	@Bean
	public LocalSessionFactoryBean sessionFactory(){

		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();

		sessionFactory.setDataSource(dataSource());
		sessionFactory.setPackagesToScan(env.getProperty("hibernate.packagesToScan"));
		sessionFactory.setHibernateProperties(hibernateProperties());

		return sessionFactory;
	}

	@Bean
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {

		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);

		return txManager;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
				.addResourceHandler("/css/**")
				.addResourceLocations("/css/");
	}
}