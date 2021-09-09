package spring.model.dao;

import java.util.List;

public interface genericDao {

	<E> E insert(E e);
	List getdata(String a);
	<E> E get(E e,int id);
	<E> void delete(E e);
	<E> void update(E e);
	public List getses(String table, String uname);
	public List getpdata(String rcolumns, String table, String column, int id);
}
