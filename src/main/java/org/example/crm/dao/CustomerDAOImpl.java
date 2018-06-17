package org.example.crm.dao;

import org.example.crm.model.Customer;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Customer> findAll() {
		return sessionFactory
				.getCurrentSession()
				.createQuery("from Customer order by lastName", Customer.class)
				.getResultList();
	}

	@Override
	public void saveCustomer(Customer customer) {
		sessionFactory
				.getCurrentSession()
				.saveOrUpdate(customer);
	}

	@Override
	public Customer getCustomer(Long id) {
		return sessionFactory
				.getCurrentSession()
				.get(Customer.class, id);
	}

	@Override
	public void deleteCustomer(Long id) {
		sessionFactory
				.getCurrentSession()
				.createQuery("delete from Customer where id=:id")
				.setParameter("id", id)
				.executeUpdate();
	}

	@Override
	public List<Customer> searchCustomers(String name) {
		if (name != null && name.trim().length() > 0) {
			String hql = "from Customer where lower(firstName) like :name " +
					"or lower(lastName) like :name or lower(email) like :name " +
					"order by lastName";
			return sessionFactory
					.getCurrentSession()
					.createQuery(hql, Customer.class)
					.setParameter("name", "%" + name.toLowerCase() + "%")
					.getResultList();
		} else {
			return findAll();
		}
	}
}
