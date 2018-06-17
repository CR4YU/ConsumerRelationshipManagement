package org.example.crm.dao;

import org.example.crm.model.Customer;
import java.util.List;

public interface CustomerDAO {

	List<Customer> findAll();

	void saveCustomer(Customer customer);

	Customer getCustomer(Long id);

	void deleteCustomer(Long id);

	List<Customer> searchCustomers(String name);
}
