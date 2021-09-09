package spring.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import spring.model.dao.genericDao;


@Repository
public class genericDaoImpl implements genericDao{

	@PersistenceContext
	private EntityManager en;
	
	@Transactional
	public <E> E insert(E e){
		return en.merge(e);
	}

	@Transactional
	public List getdata(String h) 
	{
		return en.createQuery("from "+ h +"").getResultList();
	}
	
	public List getses(String table, String uname) 
	{
		return en.createQuery("from "+ table +" where email_id = " + uname +"").getResultList();
	}
	
	public List getpdata(String rcolumns, String table, String column, int id) 
	{
		return en.createNativeQuery("select "+ rcolumns +" from "+ table +" where "+ column + " = " + id +"").getResultList();
	}

	@Transactional
	public <E> E get(E e,int id) {
		
		return (E)en.find(e.getClass(),id);
	}
	
	@Transactional
	public <E> void delete(E e) {
		
		 en.remove(en.merge(e));
	}

	@Transactional
	public <E> void update(E e) {
		en.merge(e);
	}
	
}
