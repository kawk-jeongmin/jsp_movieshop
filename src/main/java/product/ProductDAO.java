package product;

import java.sql.*;
import java.util.*;



public class ProductDAO {
	
	private PreparedStatement pstmt;
    private Connection con;
    private ResultSet rs;
    
    private static ProductDAO instance=new ProductDAO();
    
    public static ProductDAO getInstance() {
		return instance;
	}
    
    //데이터 베이스의 커넥션툴을 사용하도록 설정하는 메소드
	public ProductDAO() {
		try {
			 String dbURL = "jdbc:mysql://localhost:3306/SHOP?serverTimezone=UTC";
	            String dbID = "root";
	            String dbPassword = "Kjm0408^^";
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection(dbURL, dbID, dbPassword);     
		}catch (Exception e) {
			e.printStackTrace();
		}

    }
	
	
	public Vector<Product> getCategoryProduct(int category){
		Vector<Product> v = new Vector<>();
		Product bean = null;
		
//		ProductDAO();
		
		try {
			String sql = "select * form product where category=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bean = new Product();
				bean.setNo(rs.getString(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getString(3));
    			bean.setPrice(rs.getString(4));
    			bean.setCompany(rs.getString(5));
    			bean.setImg(rs.getString(6));
    			bean.setInfo(rs.getString(7));
				v.add(bean);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	 public Vector<Product> getAllProduct(){
			Vector<Product> v = new Vector<>();
			Product bean = null;
			
//			getCon();
			
	    	try {
	    		String sql = "select * from product";
	    		pstmt = con.prepareStatement(sql);
	    		
	    		rs = pstmt.executeQuery();
	    		
	    		while(rs.next()){
	    			bean = new Product();
	    			bean.setNo(rs.getString(1));
	    			bean.setName(rs.getString(2));
	    			bean.setCategory(rs.getString(3));
	    			bean.setPrice(rs.getString(4));
	    			bean.setCompany(rs.getString(5));
	    			bean.setImg(rs.getString(6));
	    			bean.setInfo(rs.getString(7));
	    			v.add(bean);
	    		}
	    		con.close();
	    	}catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return v;
	    }
	 
	 public Product getOneProduct(int no) {
		 Product bean = new Product();
		 
//		 getCon();
		 
		 try {
	    		String sql = "select * from product where no = ?";
	    		pstmt = con.prepareStatement(sql);
	    		
	    		rs = pstmt.executeQuery();
	    		
	    		while(rs.next()){
	    			bean = new Product();
	    			bean.setNo(rs.getString(1));
	    			bean.setName(rs.getString(2));
	    			bean.setCategory(rs.getString(3));
	    			bean.setPrice(rs.getString(4));
	    			bean.setCompany(rs.getString(5));
	    			bean.setImg(rs.getString(6));
	    			bean.setInfo(rs.getString(7));
	    		}
	    		con.close();
	    	}catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return bean;
	    }
	 
	 public int register(Product product) {
		 String SQL = "INSERT INTO product VALUES (?, ?, ?, ?, ?, ?, ?)";
		 try {
			 pstmt = con.prepareStatement(SQL);
			 pstmt.setString(1,product.getNo());
			 pstmt.setString(2,product.getName());
			 pstmt.setString(3,product.getCategory());
			 pstmt.setString(4,product.getPrice());
			 pstmt.setString(5,product.getCompany());
			 pstmt.setString(6,product.getImg());
			 pstmt.setString(7,product.getInfo());
			 return pstmt.executeUpdate();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return -1;
	 }
	 
	 public ArrayList<Product> getAllItemList() throws SQLException{
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<Product> list=new ArrayList<Product>();
			try {
				String sql="select no,name from product order by no desc";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Product product=new Product();
					product.setNo(rs.getString(1));
					product.setName(rs.getString(2));
					list.add(product);
				}
			}finally {
				if(pstmt != null) try{pstmt.close();} catch(SQLException ex) {}
				if(conn != null) try{pstmt.close();} catch(SQLException ex) {}
			}
			return list;
		}
	 
		public Product findItemByNO(String no) {
			return null;
		}
		
		/* 2번 기능
		 * findItemByNo(String itemNo) : ItemDTO
		 */
		public Product findItemByNo(String no) throws SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Product product = null;
			
			try {
				String sql = "SELECT name FROM product WHERE no = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, no);
				rs = pstmt.executeQuery();
				if (rs.next())
					product = new Product(no, rs.getString(1));
			} finally {
				if(pstmt != null) try{pstmt.close();} catch(SQLException ex) {}
				if(conn != null) try{pstmt.close();} catch(SQLException ex) {}
			}
			
			return product;
		}
	}
