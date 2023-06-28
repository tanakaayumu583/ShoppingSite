package jp.co.aforce.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import jp.co.aforce.bean.ProductBean;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Page;

@WebServlet("/jp.co.aforce.servlet/Update_product")
@MultipartConfig
public class Update_product extends HttpServlet {

	String url = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		Page.header(out);

		String product_id = request.getParameter("product_id");
		try {

			ProductDAO dao = new ProductDAO();
			List<ProductBean> list = new ArrayList<>();
			list = dao.search_product(product_id);
			session.setAttribute("search_product", list);
			if (list.size() == 1) {
				url = "/ShoppingSite/views/admin/authenticated/update_product.jsp";
				response.sendRedirect(url);
			} else {
				url = "/ShoppingSite/jp.co.aforce.servlet/Select_product_list";
				response.sendRedirect(url);
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		ProductDAO dao = new ProductDAO();
		ProductBean product = new ProductBean();
		product.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
		product.setName(request.getParameter("name"));
		product.setDescription(request.getParameter("description"));
		Part part_pre = request.getPart("pict");
		product.setPrice(Integer.parseInt(request.getParameter("price")));

		
		System.out.println("通過1");
		//▼ファイルを更新するかの判定
		//▼ファイルアップロード機能
		if (part_pre != null && part_pre.getSubmittedFileName() != null && !part_pre.getSubmittedFileName().isEmpty()) {
			System.out.println("通過2");
			product.setP_img(Paths.get(part_pre.getSubmittedFileName()).getFileName().toString());
			try {
				request.setCharacterEncoding("utf-8");
				//name属性がpictのファイルをPartオブジェクトとして取得
				Part part = request.getPart("pict");
				//ファイル名を取得
				//String filename=part.getSubmittedFileName();//ie対応が不要な場合
				String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
				//アップロードするフォルダ
				String path = getServletContext()
						.getRealPath("/img/product_img/" + request.getParameter("product_id") + "/");
				//存在チェック：なければ作成
				checkDir(path);
				//実際にファイルが保存されるパス確認
				System.out.println(path);
				//書き込み
				part.write(path + File.separator + filename);
			} catch (Exception e) {
			}
		}
		//▲ファイルアップロード機能
		//▲ファイルを更新するかの判定

		try {
			int line = dao.update_product(product);
			if (line == 1) {

				url = "/ShoppingSite/jp.co.aforce.servlet/Manage_product_list";
				response.sendRedirect(url);

			} else {
				url = "/ShoppingSite/jp.co.aforce.servlet/Manage_product_list";
				response.sendRedirect(url);
			}
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

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
