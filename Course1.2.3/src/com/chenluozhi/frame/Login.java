
package com.chenluozhi.frame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JButton;
import javax.swing.UIManager;
import java.awt.*;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.swing.JTextField;
import javax.swing.ImageIcon;

import com.chenluozhi.dao.UserDao;
import com.chenluozhi.util.DBConnection;
import com.chenluozhi.util.MusicDemo;
import javax.swing.JComboBox;

public class Login extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel jContentPane = null;
 private JButton jButton21 = null;
 private JButton jButton22 = null;
	private JTextField jTextField = null;
	private  JPasswordField jPasswordField = null;//密码输入掩体，不可复制剪切
	private JLabel jLabel = null;
	 static int storeUserId ;// 登录用户名
 public static String storeUserName = null;// 登录用户名
public  static String storeUserPassword = null;// 登录密码
	static boolean RELOAD = true;// 重新登陆标记
	static int login_user_type ;//0表示管理员，1表示老师，2表示学生
	private JLabel jLabel_User = null;
	private JLabel jLabel_userName = null;
	private JLabel jLabel_password = null;
	private JLabel jLabel_privilege = null;
	private URL imgURL = null;
	
	
	private BtnListener btl = null;//监听器
	private JComboBox jComboBox = null;//下拉列表
	private JLabel jLabel_tips = null;
	
	private void initialize() {

		jLabel_tips = new JLabel();
		jLabel_tips.setBounds(new Rectangle(15, 210, 277, 24));
		jLabel_tips.setText("用户名为ID号，用户初始密码为1");
		this.setResizable(false);
		this.setSize(300, 400);
		this.setTitle("登陆");
		imgURL = this.getClass().getResource("/com/chenluozhi/images/logo_0.png");
		this.setIconImage(Toolkit.getDefaultToolkit().getImage(imgURL));
		this.setLocationRelativeTo(null);
		 //this.setUndecorated(true);//设置无边框，有点丑，不要了
		try {
			UIManager
					.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");// 使用windows外观
		} catch (Exception e) {
			e.printStackTrace();//打印异常信息在程序中出错的位置及原因。
		}
		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
		jButton21 = new JButton();
		jButton21.setBounds(new Rectangle(30, 295, 78, 26));
		
/*	InputStream in=this.getClass().getResourceAsStream("");
		Reader data=new InputStreamReader(in);*/
	
		imgURL = this.getClass().getResource("/com/chenluozhi/images/icon.png");//解决打包找不到资源的问题
	
		jButton21.setText("登录");
		getRootPane().setDefaultButton(jButton21);// 回车登录

		jButton22 = new JButton();
		jButton22.setBounds(new Rectangle(180, 295, 78, 26));
		jButton22.setText("退出");

		jTextField = new JTextField(20);//用户名输入区
		jTextField.setBounds(new Rectangle(120, 160, 124, 23));

		jPasswordField = new JPasswordField();//密码输入区
		jPasswordField.setBounds(new Rectangle(120, 190, 124, 23));

		jLabel = new JLabel();
		jLabel.setText("");
		jLabel.setBounds(new Rectangle(0, -1, 300, 150));//芙宁娜
		imgURL = this.getClass().getResource("/com/chenluozhi/images/login.png");
		jLabel.setIcon(new ImageIcon(imgURL));
		jLabel_password = new JLabel();
		jLabel_password.setBounds(new Rectangle(29, 192, 71, 19));


		jLabel_password.setText("密 码：");
		jLabel_password.setFont(new Font("微软雅黑", Font.PLAIN, 12)); // 设置初始字体（使用微软雅黑字体）

		Font currentFont = jLabel_password.getFont();
		Font newFont = currentFont.deriveFont(20f);
		jLabel_password.setFont(newFont);


		jLabel_userName = new JLabel();
		jLabel_userName.setBounds(new Rectangle(29, 160, 71, 19));
		jLabel_userName.setText("用户名：");
		jLabel_User = new JLabel();
		jLabel_User.setBounds(new Rectangle(10, 147, 275, 98));
		
		
		jLabel_privilege = new JLabel();
		jLabel_privilege.setBounds(new Rectangle(29, 250, 71, 19));
		jLabel_privilege.setText("登陆类型：");
		
		jComboBox = new JComboBox();
		jComboBox.setBounds(new Rectangle(109, 250, 123, 23));
		jComboBox.addItem("管理登陆");
		jComboBox.addItem("老师登录");
		jComboBox.addItem("学生登陆");
		

		
		imgURL = this.getClass().getResource("/com/chenluozhi/images/user.gif");
		jLabel_User.setIcon(new ImageIcon(imgURL));
		jLabel_User.setText("User");

		jContentPane = new JPanel();// 新建jPanel面板
		jContentPane.setLayout(null);
		jContentPane.setBackground(new Color(255, 255, 255));
		jContentPane.add(jLabel_userName, null);
		jContentPane.add(jLabel_password, null);
		jContentPane.add(jButton21, null);
		jContentPane.add(jButton22, null);
		jContentPane.add(jTextField, null);
		jContentPane.add(jPasswordField, null);
		jContentPane.add(jLabel, null);
		jContentPane.add(jLabel_User, null);

		jContentPane.add(jComboBox, null);
		jContentPane.add(jLabel_privilege, null);
		jContentPane.add(jLabel_tips, null);
		setContentPane(jContentPane);
		
		btl = new BtnListener();
		jButton21.addActionListener(btl);
		jButton22.addActionListener(btl);

	}

	/**
	 * @监听类
	 * @author Administrator
	 */
	public class BtnListener implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			if (e.getSource() == jButton21) {
				UserDao ud = new UserDao();
				String user = jTextField.getText().trim();//trim函数删去文本前后空白
				String password =new String(jPasswordField.getPassword()).trim();//char to String
				
				storeUserName = user;
				storeUserPassword = password;
				login_user_type=jComboBox.getSelectedIndex();//getSelectedIndex() 返回当前选项的索引
				
				if("".equals(user)){
					JOptionPane.showMessageDialog(null, "用户名不能为空");return;
				}
				if("".equals(password)){
					JOptionPane.showMessageDialog(null, "密码不能为空");return;
				}
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String dt = sdf.format(new java.util.Date());	
				
				//如果是管理员，可以直接使用账户登录
				if(login_user_type==0){
					
					if(ud.userLogin(login_user_type, storeUserName, storeUserPassword))
					{
						
						dispose();//终止
						MainFrame mf = new MainFrame();
						mf.setVisible(true);	
					    JOptionPane.showMessageDialog(null, "欢迎 "+ user + "登陆！", "关于选修课程管理系统",JOptionPane.INFORMATION_MESSAGE);//弹窗JOptionPane
					    storeUserId = ud.getUserIdByUserName(storeUserName);
					    String log_operate = "["+storeUserName+"]"+"管理员登陆系统";
					    DBConnection.update("insert into c_log(login_user,log_operate,log_time) values('"+storeUserName+"','"+log_operate+"','"+dt+"')");				    		
					}else{JOptionPane.showMessageDialog(null, "登录失败");return;}
					//教师登录
				}else if(login_user_type==1){
					
					if(ud.userLogin(login_user_type, storeUserName, storeUserPassword))
					{
						
						dispose();
						MainFrame mf = new MainFrame();
						mf.setVisible(true);	
					    JOptionPane.showMessageDialog(null, "欢迎 "+ storeUserName + "号教师登陆！", "关于选修课程管理系统",JOptionPane.INFORMATION_MESSAGE);
					    
					    String log_operate = "["+storeUserName+"]号教师"+"用户登陆系统";
					    DBConnection.update("insert into c_log(login_user,log_operate,log_time) values('"+storeUserName+"','"+log_operate+"','"+dt+"')");
					    
				}else{JOptionPane.showMessageDialog(null, "登录失败");return;}		
				}else if(login_user_type==2){	
						
					if(ud.userLogin(login_user_type, storeUserName, storeUserPassword))
					{		
						dispose();
						MainFrame mf = new MainFrame();
						mf.setVisible(true);	
					    JOptionPane.showMessageDialog(null, "欢迎 "+ user + "号学生登陆！", "关于选修课程管理系统",JOptionPane.INFORMATION_MESSAGE);		    
					    String log_operate = "["+storeUserName+"]"+"号学生登陆系统";
					    DBConnection.update("insert into c_log(login_user,log_operate,log_time) values('"+storeUserName+"','"+log_operate+"','"+dt+"')");				    		
					}else{JOptionPane.showMessageDialog(null, "登录失败");return;}
				}
				}
			
			else if (e.getSource() == jButton22) {
				System.exit(0);
			}
		}
	}


/**
 * @主函数
 * @param args
 */
	public static void main(String[] args) {
		Login login = new Login(RELOAD);
		login.setVisible(true);
	}

	public Login() {
		super();
		initialize();
	}

	public Login(boolean reload) {
		super();
		initialize();
		new MusicDemo();// 背景音乐
	}
}  //  @jve:decl-index=0:visual-constraint="10,10" 
