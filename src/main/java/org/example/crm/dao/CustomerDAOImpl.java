package org.example.crm.dao;

import org.example.crm.model.Customer;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public List<Customer> findAll() {
		return sessionFactory
				.getCurrentSession()
				.createQuery("from Customer", Customer.class)
				.getResultList();
	}
}
