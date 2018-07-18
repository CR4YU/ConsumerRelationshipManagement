# ConsumerRelationshipManagement
 Fully working simple CRUD app with Spring, Spring MVC, Spring Security, Spring AOP, Hibernate and PostgreSQL


Application allows to list, create, edit and delete customers.
## Technologies:
* Java 10
* Spring 5
* Spring MVC
* Spring Security
* Spring AOP
* Hibernate 5
* PostgreSQL 10

## Users and roles
* **john**  
password: 1234  
roles: employee  
access: list customers
* **mary**  
password: 1234  
roles: manager, employee  
access: list customers, add customers, update customers
* **susan**  
password: 1234  
roles: admin, employee  
access: list customers, add customers, update customers, delete customers



## Screenshots
##### Login
![Alt text](screenshots/login.png?raw=true "Screenshot - save")
#### List all customers
![Alt text](screenshots/list.png?raw=true "Screenshot - list")
##### Save customer
![Alt text](screenshots/save.png?raw=true "Screenshot - save")
