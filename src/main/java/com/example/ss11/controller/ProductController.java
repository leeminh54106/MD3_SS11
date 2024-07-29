package com.example.ss11.controller;

import com.example.ss11.entity.Product;
import com.example.ss11.service.IProductService;
import com.example.ss11.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/productcontroller")
public class ProductController extends HttpServlet {
    //sau khi làm xong id tự tăng
   IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "VIEWADD":
                req.getRequestDispatcher("/products/add_product.jsp").forward(req, resp);
                break;
            case "DELETE":
            {
                Long id = Long.parseLong(req.getParameter("id"));
                productService.deleteByid(id);
                listProducts(req, resp);
                break;
            }
            case "VIEWEDIT":
            {
                Long id = Long.parseLong(req.getParameter("id"));
                Product product = productService.findById(id);
                req.setAttribute("product", product);
                req.getRequestDispatcher("/products/edit_product.jsp").forward(req, resp);
                break;
            }
            default:
                listProducts(req, resp);
        }

    }
    public void listProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = new ProductServiceImpl().products;
        req.setAttribute("products", products);
        req.getRequestDispatcher("/products/products.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "HANDLEADD": {
                String name = req.getParameter("name");
                String description = req.getParameter("description");
                Double price = Double.parseDouble(req.getParameter("price"));
                String producer = req.getParameter("producer");
                Boolean status = Boolean.parseBoolean(req.getParameter("status"));

                Product product = new Product();
                product.setName(name);
                product.setDescription(description);
                product.setPrice(price);
                product.setProducer(producer);
                product.setStatus(status);

                //sau khi làm xong id tự tăng
                productService.addProduct(product);

                //c1: gọi lại listProduct để nó hiển thị
//                listProducts(req, resp);

                //c2:sendRedicert : là methor get
                resp.sendRedirect("/productcontroller");
                break;
            }
            case "HANDLEUPDATE": {
                //thêm dòng này
                Long id = Long.parseLong(req.getParameter("id"));

                String name = req.getParameter("name");
                String description = req.getParameter("description");
                Double price = Double.parseDouble(req.getParameter("price"));
                String producer = req.getParameter("producer");
                Boolean status = Boolean.parseBoolean(req.getParameter("status"));


                Product product = new Product();
                product.setId(id);

                //thêm vào sau
                productService.updateProduct(product);

                product.setName(name);
                product.setDescription(description);
                product.setPrice(price);
                product.setProducer(producer);
                product.setStatus(status);

                //c2:sendRedicert : là methor get
                resp.sendRedirect("/productcontroller");
                break;
            }
            case "SEARCH":
            {
                String search = req.getParameter("search");
                List<Product> result = productService.searchProduct(search);
                req.setAttribute("products", result);
                req.getRequestDispatcher("/products/products.jsp").forward(req, resp);
                break;
            }
            default:
                listProducts(req, resp);
        }
    }
}
