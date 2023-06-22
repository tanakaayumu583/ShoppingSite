package jp.co.aforce.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import jp.co.aforce.bean.ProductBean;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Page;

@WebServlet("/jp.co.aforce.servlet/Add_product")
@MultipartConfig
public class Add_product extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		try {
		Page.header(out);
		//postの値を取得
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		
		//beanに格納
		ProductBean product = new ProductBean();
		product.setName(name);
		product.setDescription(description);
		product.setPrice(Integer.parseInt(price));
		Part part_pre=request.getPart("pict");
		product.setP_img(Paths.get(part_pre.getSubmittedFileName()).getFileName().toString());




			String url = "";
			ProductDAO dao = new ProductDAO();
			int product_id = dao.insert_product(product);
			if (product_id > 0) {
				
				
				//▼ファイルアップロード機能
				try {
				request.setCharacterEncoding("utf-8");
				//name属性がpictのファイルをPartオブジェクトとして取得
				Part part=request.getPart("pict");
				//ファイル名を取得
				//String filename=part.getSubmittedFileName();//ie対応が不要な場合
				String filename=Paths.get(part.getSubmittedFileName()).getFileName().toString();
				//アップロードするフォルダ
				String path=getServletContext().getRealPath("/img/product_img/"+product_id+"/");
				//存在チェック：なければ作成
				checkDir(path);
				//実際にファイルが保存されるパス確認
				System.out.println(path);
				//書き込み
				part.write(path+File.separator+filename);
				}catch(Exception e) {}
				//▲ファイルアップロード機能
				url = "/ShoppingSite/jp.co.aforce.servlet/Manage_product_list";
				response.sendRedirect(url);
			}else {
				
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}
	
	//フォルダ存在チェック
	public boolean checkDir(String path) {
		File stopDir = new File(path);
		// ディレクトリ存在チェック
		if (!stopDir.exists()) {
			stopDir.mkdirs();
			return false;
		} else {
			return true;
		}
	}

}
