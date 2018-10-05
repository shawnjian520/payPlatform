package com.jd.traffic.pay.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.CachedRowSet;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;

import com.jd.framework.jdbc.DBConn;
import com.jd.framework.jdbc.handler.PageHandler;
import com.jd.framework.jdbc.handler.ResultSetHandler;
import com.jd.framework.jdbc.handler.StoredProcedureHandler;
import com.jd.framework.util.Pager;
import com.jd.framework.util.SpringUtils;
import com.jd.system.util.CommonQuery;

/*******************************************************************************
 *
 * 模块说明： 数据库操作常用工具类 作 者：Yangjianliang 创建日期：2007-2-5
 *
 ******************************************************************************/
public final class DBUtil {

	private static final Log LOG = LogFactory.getLog(DBUtil.class);
	/**
	 * 执行更新语句，可以是insert、update或者delete语句
	 * 采用非预编译方式，适合执行一次性执行的SQL语句
	 * @param sql SQL语句（不带?的那种）
	 * @return 受影响的记录行数
	 */
	public static int executeOneoffSQL(String sql) {
		sql = CommonQuery.transfSql(sql);
        int updatedRows = -1;
        if(SpringUtils.getJdbcTemplate()!=null){
            if (LOG.isInfoEnabled()) {
                LOG.info("SpringUtils.getJdbcTemplate() execute >>> " + sql);
            }
            updatedRows = SpringUtils.getJdbcTemplate().update(sql);
        }else{
            LOG.info(sql);
            Connection con = DBConn.getConnection();
            Statement stmt = null;
            try {
                stmt = con.createStatement();
                updatedRows = stmt.executeUpdate(sql);
            } catch (SQLException e) {
                LOG.error(sql, e);
                throw new RuntimeException(e);
            } finally {
                close(LOG, null, stmt, con);
            }
        }
		return updatedRows;
	}

	/**
	 * 执行更新语句，可以是insert、update或者delete语句
	 *
	 * @param sql SQL预编译语句（可带?的那种）
	 * @param in_params 参数
	 * @return 受影响的记录行数
	 */
	public static int executeSQL(String sql, Object... in_params) {
		sql = CommonQuery.transfSql(sql);
        int updatedRows = -1;
        if(SpringUtils.getJdbcTemplate()!=null){
            if (LOG.isInfoEnabled()) {
                LOG.info("SpringUtils.getJdbcTemplate() execute >>> " + sql);
            }
            in_params = deleteNull(in_params);//去除为 null 的参数，否则会出现和?替代付个数一致问题
            updatedRows = SpringUtils.getJdbcTemplate().update(sql, in_params);
        }else{
            LOG.info(sql);
            Connection con = DBConn.getConnection();
            PreparedStatement pstmt = null;
            try {
                pstmt = con.prepareStatement(sql);
                if (in_params != null) {
                    for (int i = 0, j = in_params.length; i < j; i++) {
                        if (in_params[i] != null) {
                            pstmt.setObject(i + 1, in_params[i]);
                        }
                    }
                }
                updatedRows = pstmt.executeUpdate();
            } catch (SQLException e) {
                LOG.error(sql, e);
                throw new RuntimeException(e);
            } finally {
                close(LOG, null, pstmt, con);
            }
        }
		return updatedRows;
	}

	/**
	 * 批量更新，PreparedStatement 方式 此方法的常见应用场景是一次批量的插入数据
	 *
	 * @param sql SQL预编译语句
	 * @param values 值集合
	 * @return an array of update counts containing one element for each command
	 *         in the batch. The elements of the array are ordered according to
	 *         the order in which commands were added to the batch.
	 */
	public static int[] executeBatch(String sql, List<Object[]> values) {
		sql = CommonQuery.transfSql(sql);
        int[] updatedRows = null;
        if(SpringUtils.getJdbcTemplate()!=null){
            if (LOG.isInfoEnabled()) {
                LOG.info("SpringUtils.getJdbcTemplate() execute >>> " + sql);
            }
            updatedRows = SpringUtils.getJdbcTemplate().batchUpdate(sql, values);
        }else{
            LOG.info(sql);
            Connection con = DBConn.getConnection();
            boolean autoCommit = false;
            PreparedStatement pstmt = null;
            try {
                autoCommit = con.getAutoCommit();
                con.setAutoCommit(false);
                pstmt = con.prepareStatement(sql);
                for (int i = 0, j = values.size(); i < j; i++) {
                    Object[] row = values.get(i);
                    for (int k = 0; k < row.length; k++) {
                        pstmt.setObject(k + 1, row[k] == null ? "" : row[k]);
                    }
                    pstmt.addBatch();
                }
                updatedRows = pstmt.executeBatch();
                con.commit();
            } catch (SQLException e) {
                LOG.error("DBUtil error", e);
                try {
                    con.rollback();
                } catch (SQLException e1) {
                    LOG.error("事务回滚失败！", e);
                }
                throw new RuntimeException(e);
            } finally {
                try {
                    con.setAutoCommit(autoCommit);
                } catch (SQLException e) {
                    LOG.error("恢复AutoCommit值失败！", e);
                }
                close(LOG, null, pstmt, con);
            }
        }
		return updatedRows;
	}

	/**
	 * 批量执行，即多条SQL命令语句的时候
	 *
	 * @param statements 已经拼接好值的SQL语句集合
	 * @return 受影响的记录行数
	 */
	public static int[] executeBatch(List<String> statements) {
		
        if(statements==null || statements.isEmpty()){
            return null;
        }
        int[] updatedRows = null;
        if(SpringUtils.getJdbcTemplate()!=null){
            if (LOG.isInfoEnabled()) {
                LOG.info("SpringUtils.getJdbcTemplate() execute >>> " + statements.get(0) + " <<< ...");
            }
            updatedRows = SpringUtils.getJdbcTemplate().batchUpdate(statements.toArray(new String[]{}));
        }else{
            Connection con = DBConn.getConnection();
            Statement stmt = null;
            try {
                stmt = con.createStatement();
                for (int i = 0; i < statements.size(); i++) {
                    stmt.addBatch(statements.get(i));
                }
                updatedRows = stmt.executeBatch();
            } catch (SQLException e) {
                LOG.error(e);
                throw new RuntimeException(e);
            } finally {
                close(LOG, null, stmt, con);
            }
        }
		return updatedRows;
	}

	/**
	 * 查询符合条件的全部数据记录集 提供给本类内部调用，直接返回查询结果，不维护数据库连接。 注意这个方法不负责分页的，切勿操作大数据量查询
	 *
	 * @param pstmt 执行陈述对象，已经包含sql
	 * @param params 参数值
	 * @return java.sql.RowSet 符合条件的全部数据,Never null
	 * @throws SQLException 执行过程中抛出的异常
	 */
	private static ResultSet queryData(PreparedStatement pstmt, Object... params) throws SQLException {

		if (null != params && params.length > 0) {
			for (int i = 0, j = params.length; i < j; i++) {
				if (params[i] != null) {
					pstmt.setObject(i + 1, params[i]);
				}
			}
		}

		return pstmt.executeQuery();
	}

	/**
	 * 查询符合条件的全部数据记录集 注意这个方法不负责分页的，切勿操作大数据量查询
	 *
	 * @param sql
	 * @param params 参数值
	 * @return CachedRowSet 符合条件的全部数据,Never null
	 * @throws SQLException
	 */
	public static ResultSet queryRowSet(String sql, Object... params) {
		sql = CommonQuery.transfSql(sql);
		if (LOG.isInfoEnabled()) {
			LOG.info(sql);
		}

        CachedRowSet crs = null;
        if(SpringUtils.getJdbcTemplate()==null){
            Connection conn = DBConn.getConnection();
            ResultSet rs = null;
            PreparedStatement pstmt = null;
            try {
                // sun的CachedRowSetImpl会抛出Invalid scale size. Cannot be less than
                // zero异常
                crs = ResultSetHandler.getCachedRowSetInstance();
                pstmt = conn.prepareStatement(sql);
                rs = queryData(pstmt, params);
                crs.populate(rs);
            } catch (SQLException e) {
                LOG.error(sql + "\n" + e);
                throw new RuntimeException(e);
            } finally {
                close(LOG, rs, pstmt, conn);
            }
        }else{
            params = deleteNull(params);//去除为 null 的参数，否则会出现和?替代付个数一致问题
            crs = SpringUtils.getJdbcTemplate().query(sql, new ResultSetExtractor<CachedRowSet>() {
                
                public CachedRowSet extractData(ResultSet rs) throws SQLException, DataAccessException {
                    CachedRowSet crs = ResultSetHandler.getCachedRowSetInstance();
                    crs.populate(rs);
                    return crs;
                }
            }, params);
        }

		return crs;
	}

	/**
	 * 查询并返回所有符合条件的数据，注意传入的SQL应尽量返回少的结果 注意这个方法不负责分页的，切勿操作大数据量查询
	 *
	 * @param sql 完整的查询语句(指定了具体查询字段)
	 * @return 返回查询结果以List形式,never null
	 */
	public static List<Object[]> queryAllList(String sql, Object... params) {

		return queryPageList(null, sql, params);
	}

	/**
	 * 查询并返回分页后的符合条件的数据
	 *
	 * @param pager 分页对象
	 * @param sql 完整的查询语句(指定了具体查询字段)
	 * @param params 参数值
	 * @return 返回查询结果以List形式 Never null
	 */
	public static List<Object[]> queryPageList(Pager pager, String sql, Object... params) {
		sql = CommonQuery.transfSql(sql);
		if (pager != null) {
			sql = PageHandler.convert2PagedSQL(pager, sql);
		}

		List<Object[]> list = null;
		ResultSet rs = queryRowSet(sql, params);

		try {
			rs.last();
			int size = rs.getRow();

			if (size < 1) {
				close(LOG, rs, null, null);
				return new ArrayList<Object[]>(0);
			}
			list = new ArrayList<Object[]>(size);
			rs.beforeFirst();
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnNum = rsmd.getColumnCount();

			while (rs.next()) {
				Object[] bean = null;
				if (pager != null) {
					bean = ResultSetHandler.getUniPageRowColumnsValues(rs, columnNum);// 支持分页的取值
				} else {
					bean = ResultSetHandler.getRowColumnsValues(rs, columnNum);// 不需要分页的取值
				}
				list.add(bean);
			}
		} catch (SQLException e) {
			LOG.error(sql + "\n" + e);
			throw new RuntimeException(e);
		} finally {
			close(LOG, rs, null, null);
		}

		return list;
	}

    /**
     * 把查询结果封装到list<Map>之中，配合页面EL等表达式，可以直接list[i].fieldName取值。
     * 注意此方法返回所有符合条件的结果集，不分页。
     * @since 2.1
     * @param sql
     * @param params
     * @return
     */
    public static List<Map<String,String>> queryForList(String sql, Object... params){
        return queryForList(null, sql, params);
    }
    
    public static List<Map<String,String>> queryPageForList(Pager pager,String sql, Object... params){
        return queryForList(pager, sql, params);
    }

    /**
     * 把查询结果封装到list<Map>之中，配合页面EL等表达式，可以直接list[i].fieldName取值。
     * @since 2.1
     * @param pager 分页对象
     * @param sql
     * @param params
     * @return
     */
    public static List<Map<String,String>> queryForList(Pager pager, String sql, Object... params){
    	sql = CommonQuery.transfSql(sql);
        if (pager != null) {
            sql = PageHandler.convert2PagedSQL(pager, sql);
        }
        List<Map<String,String>> list = new ArrayList<Map<String, String>>();
        ResultSet rs = queryRowSet(sql, params);
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            int count=rsmd.getColumnCount();
            String[] name=new String[count];  //列名称
            for(int i=0;i<count;i++)
            {
                name[i] = rsmd.getColumnLabel(i+1); // 默认取字段别名
                if(StringUtils.isBlank(name[i])){
                    name[i] = rsmd.getColumnName(i+1);
                }
                name[i] = name[i].toUpperCase();
            }
            while (rs.next()) {
                Map<String,String> tempmap = new HashMap<String, String>();
                for(int i=0;i<name.length;i++){
                    String tempstr = name[i];
                    tempmap.put(tempstr.toLowerCase(),rs.getString(tempstr));      //key为统一为小写
                }
                list.add(tempmap);
            }
        } catch (SQLException e) {
            LOG.error(sql + "\n" + e);
            throw new RuntimeException(e);
        } finally {
            close(LOG, rs, null, null);
        }
        return list;
    }

	/**
	 * 查询一行记录中的一些字段列 注意只返回一行记录
	 *
	 * @param sql 完整的查询语句
	 * @return 返回查询结果以Object[]形式，当查询的记录行不存在时，返回null
	 */
	public static Object[] queryRowColumns(String sql, Object... params) {
		sql = CommonQuery.transfSql(sql);
		Object[] columns = null;
		ResultSet rs = queryRowSet(sql, params);

		try {
			rs.last();
			int size = rs.getRow();

			if (size < 1) {
				close(LOG, rs, null, null);
				return null;
			} else if (size > 1) {
				close(LOG, rs, null, null);
				throw new RuntimeException("超出方法能力，查询的结果集大于一行记录！");
			}

			rs.beforeFirst();
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnNum = rsmd.getColumnCount();

			if (rs.next()) {
				columns = ResultSetHandler.getRowColumnsValues(rs, columnNum);
			}
		} catch (SQLException e) {
			LOG.error(sql);
			LOG.error(e);
			throw new RuntimeException(e);
		} finally {
			close(LOG, rs, null, null);
		}

		return columns;
	}

	/**
	 *
	 * 查询并返回所有符合条件的数据 注意这个方法不负责分页的，切勿操作大数据量查询
	 * 注意：通过对象属性名称填充对象。推荐采用此方法替代早前的构造函数创建对象方法。
	 * @param beanClass 要封装后返回的对象
	 * @param sql 完整的查询语句(指定了具体查询字段)
	 * @return 返回查询结果以List形式
	 * @param params 参数值
	 * @return 对象结果集 never null
	 * @throws Exception
	 */
	public static <T> List<T> queryAllBeanList(String sql, Class<T> beanClass, Object... params) throws RuntimeException {

		return queryPageBeanList(null, sql, beanClass, params);
	}

	/**
	 *
	 * 查询并返回所有符合条件的数据对象。自动分页支持，需要有pager对象。
	 * 注意：通过对象属性名称填充对象。推荐采用此方法替代早前的构造函数创建对象方法。
	 * @param pager 分页对象
	 * @param beanClass 要封装后返回的对象
	 * @param sql 完整的查询语句(指定了具体查询字段)
	 * @return 返回查询结果以List形式
	 * @param params 参数值
	 * @return 对象结果集，never null
	 * @throws Exception
	 */
	public static <T> List<T> queryPageBeanList(Pager pager, String sql, Class<T> beanClass, Object... params) {
		sql = CommonQuery.transfSql(sql);
		if (LOG.isInfoEnabled()) {
			LOG.info(sql);
		}

		if (pager != null) {
			sql = PageHandler.convert2PagedSQL(pager, sql);
		}

        List<T> results;

        if(SpringUtils.getJdbcTemplate()==null){
            Connection conn = DBConn.getConnection();
            QueryRunner qr = new QueryRunner();

            try {
                results = qr.query(conn, sql, new BeanListHandler<T>(beanClass), params);
            } catch (SQLException e) {
                LOG.error(sql);
                LOG.error(e);
                throw new RuntimeException(e);
            } finally {
                close(LOG, null, null, conn);
            }
        }else{
            params = deleteNull(params);//去除为 null 的参数，否则会出现和?替代付个数一致问题
            results = SpringUtils.getJdbcTemplate().query(sql, ParameterizedBeanPropertyRowMapper.newInstance(beanClass), params);
        }

		return results;
	}

	/**
	 * 查询后返回一个对象
	 * 注意：通过对象属性名称填充对象。推荐采用此方法替代早前的构造函数创建对象方法。
	 * @param beanClass 结果对象
	 * @param sql select count(*) from ...
	 * @param params 参数值
	 * @return 单个结果对象，当查询的对象不存的时候，返回null
	 * @throws SQLException
	 */
	public static <T> T queryBean(String sql, Class<T> beanClass, Object... params) {
		sql = CommonQuery.transfSql(sql);
		if (LOG.isInfoEnabled()) {
			LOG.info(sql);
		}

		T bean = null;

        if(SpringUtils.getJdbcTemplate()==null){
            Connection conn = DBConn.getConnection();
            QueryRunner qr = new QueryRunner();

            try {
                bean = qr.query(conn, sql, new BeanHandler<T>(beanClass), params);
            } catch (SQLException e) {
                LOG.error(sql);
                LOG.error(e);
                throw new RuntimeException(e);
            } finally {
                close(LOG, null, null, conn);
            }
        }else{
            params = deleteNull(params);//去除为 null 的参数，否则会出现和?替代付个数一致问题
            try {
                bean = SpringUtils.getJdbcTemplate().queryForObject(sql, ParameterizedBeanPropertyRowMapper.newInstance(beanClass), params);
            } catch (EmptyResultDataAccessException e) {
                return null;
            }
        }

		return (T) bean;
	}

	/**
	 * 查询一个字段的值。某行里的某列的值。
	 *
	 * @param sql select count(*) from ...
	 * @param params 参数值
	 * @return 某行里的某列的值。单个结果对象。
	 * @throws SQLException
	 */
	public static Object queryFieldValue(String sql, Object... params){
		sql = CommonQuery.transfSql(sql);
		if (LOG.isInfoEnabled()) {
			LOG.info(sql);
		}

        Object object = null;
        if(SpringUtils.getJdbcTemplate()==null){
            Connection conn = DBConn.getConnection();
            ResultSet rs = null;
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(sql);
                rs = queryData(pstmt, params);
                if (rs.next()) {
                    object = rs.getObject(1);
                }
            } catch (SQLException e) {
                LOG.error(sql + "\n" + e);
                throw new RuntimeException(e);
            } finally {
                close(LOG, rs, pstmt, conn);
            }
        }else{
            params = deleteNull(params);//去除为 null 的参数，否则会出现和?替代付个数一致问题
            try {
                object = SpringUtils.getJdbcTemplate().queryForObject(sql, new RowMapper<Object>() {
                    
                    public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
                        return rs.getObject(1);
                    }
                }, params);
            } catch (EmptyResultDataAccessException e) {
                return null;
            }
        }

		return object;
	}
	
	/**
	 * 查询一个字段的值。某行里的某列的值 Conn需手动关闭 用于短时间内多次查询。
	 *
	 * @param sql select count(*) from ...
	 * @param params 参数值
	 * @return 某行里的某列的值。单个结果对象。
	 * @throws SQLException
	 */
	public static Object queryFieldValueByConn(Connection conn,String sql, Object... params){
		sql = CommonQuery.transfSql(sql);
		if (LOG.isInfoEnabled()) {
			LOG.info(sql);
		}

        Object object = null;
        if(SpringUtils.getJdbcTemplate()==null){
            ResultSet rs = null;
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(sql);
                rs = queryData(pstmt, params);
                if (rs.next()) {
                    object = rs.getObject(1);
                }
            } catch (SQLException e) {
                LOG.error(sql + "\n" + e);
                throw new RuntimeException(e);
            } finally {
                close(LOG, rs, pstmt, null);
            }
        }else{
            params = deleteNull(params);//去除为 null 的参数，否则会出现和?替代付个数一致问题
            try {
                object = SpringUtils.getJdbcTemplate().queryForObject(sql, new RowMapper<Object>() {
                    
                    public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
                        return rs.getObject(1);
                    }
                }, params);
            } catch (EmptyResultDataAccessException e) {
                return null;
            }
        }

		return object;
	}

	/**
	 * 查询记录总数
	 *
	 * @param sql select count(*) from ...语句，如果语句是 from...格式，会自动加上select
	 *            count(*)部分。
	 * @return 统计出来的记录数
	 */
	public static int count(String sql, Object... params){
		sql = CommonQuery.transfSql(sql);
		if (sql == null || sql.trim().equals("")) {
			throw new RuntimeException("期望是select count(*) from ...查询语句，实际传入了空字符串！");
		}

		if (sql.trim().toUpperCase().startsWith("FROM")) {
			sql = "SELECT COUNT(*) " + sql;
		}
		if ( !sql.toUpperCase().contains("COUNT(") ) {
			throw new RuntimeException(sql + " 不是有效的select count(*) from ...查询语句！");
		}
		int rowsCount = 0;
        if(SpringUtils.getJdbcTemplate()==null){
            Object val = queryFieldValue(sql, params);
            String s_val = String.valueOf(val);
            if (s_val != null) {
                rowsCount = Integer.parseInt(s_val);
            }
        }else{
            params = deleteNull(params);//去除为 null 的参数，否则会出现和?替代付个数一致问题
            rowsCount = SpringUtils.getJdbcTemplate().queryForInt(sql, params);
        }
		return rowsCount;
	}

    public static long countForLong(String sql, Object... params){
        Integer ct = count(sql, params);
        return ct.longValue();
    }

	/**
	 * 关闭数据库连接资源
	 *
	 * @param targetlog log句柄，如果目标类没有log对象，传入null即可，会使用此类的log输出异常
	 * @param rs
	 * @param stmt
	 * @param conn
	 */
	public static void close(Log targetlog, ResultSet rs, Statement stmt, Connection conn) {
		if (targetlog == null) {
			targetlog = LOG;
		}
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			targetlog.error(e);
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
				targetlog.error(e);
			} finally {
				DBConn.close(conn);
			}
		}
	}

	/**
	 * 常见的SQL语句拼接，如
	 *
	 * @param columnName 表字段名称
	 * @param sqlconnector 连接符号 = 和 like
	 * @param values 字段值
	 * @return (a=1 or b=2)或者(a='t' or b='ax') (a like 'aaa%' or b like 'dw%')
	 */
	public static String spellSqlWhere(String columnName, String sqlconnector, final Object[] values) {
		StringBuffer where = new StringBuffer(" (");
		for (Object value : values) {
			if ("=".equals(sqlconnector)) {
				if (value instanceof String) {
					where.append(columnName).append(" ").append(sqlconnector).append(" '").append(value)
							.append("' or ");
				} else {
					where.append(columnName).append(" ").append(sqlconnector).append(" ").append(value).append(" or ");
				}
			} else if ("like".equalsIgnoreCase(sqlconnector)) {
				where.append(columnName).append(" ").append(sqlconnector).append(" '").append(value).append("%' or ");
			}
		}
		where.delete(where.lastIndexOf(" or"), where.length());
		return where.append(") ").toString();
	}

	/**
	 * 调用有返回值的数据库存储过程，如果返回值有多个集合，总是返回最后一个数据集，封装成List<bean>返回
	 * @param proceduceName 过程名称 procname(?,?,?)；oracle最后一个问号是返回参数，mysql全是传入参数
	 * @param beanClass 要封装为哪个对象
	 * @param in_params 输入参数值
	 * @return List<T> 存储过程返回的结果集
	 */
	public static <T> List<T> callProcQueryGetBeans(String proceduceName, Class<T> beanClass, Object... in_params) {
		
		return StoredProcedureHandler.execProcQueryGetBeans(proceduceName, beanClass, in_params);
	}

	/**
	 * 调用有返回值的数据库存储过程，如果返回值有多个集合，总是返回最后一个数据集，封装成ArrayList返回
	 * @param proceduceName 过程名称 procname(?,?,?)；oracle最后一个问号是返回参数，mysql全是传入参数
	 * @param in_params 输入参数值
	 * @return List<Object[]> 存储过程返回的结果集
	 */
	public static List<Object[]> callProcQueryGetList(String proceduceName, Object... in_params) {
		
		return StoredProcedureHandler.execProcQueryGetList(proceduceName, in_params);
	}

	/**
	 * 调用返回字符串的数据库存储过程。
	 * @param proceduceName 过程名称 procname(?,?,?)；oracle最后一个问号是返回参数，mysql全是传入参数
	 * @param in_params 输入参数值
	 * @return 存储过程返回的对象（记录集、字符串等）
	 * @throws SQLException
	 */
	public static String callProcQueryString(String proceduceName, Object... in_params) throws SQLException {

		return StoredProcedureHandler.execProcQueryString(proceduceName, in_params);
	}

	/**
	 * 调用有返回值的数据库存储过程，如果返回值有多个集合，总是返回最后一个数据集。
	 * @param proceduceName 过程名称 procname(?,?,?)；oracle最后一个问号是返回参数，mysql全是传入参数
	 * @param in_params 输入参数值
	 * @return 存储过程返回的对象（记录集、字符串等）
	 * @throws SQLException
	 */
	@Deprecated
	public static Object callProcQueryObject(String proceduceName, Object... in_params) throws SQLException {

		return StoredProcedureHandler.execProcQueryObject(proceduceName, in_params);
	}

	/**
	 * 执行存储过程，无返回值
	 * @param proceduceName 过程名称 procname(?,?,?)（注意没有返回参数的，只会有输入参数）
	 * @param params 输入参数值
	 * @throws SQLException
	 */
	public static void callProcNoneQuery(String proceduceName, Object... params) throws SQLException {

		StoredProcedureHandler.execProcNoneQuery(proceduceName, params);
	}

    protected static Object[] deleteNull(Object[] params){
        ArrayList<Object> args = new ArrayList<Object>();
        for(Object o : params){
            if(o!=null){
                args.add(o);//去除参数中的 null
            }
        }
        return args.toArray();
    }
}
