package com.Pharmacy.medicine;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import java.io.*;

public class LoadAdminContactInfoServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = getServletContext().getRealPath("admin_contact_info.xml");
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(new File(filePath));

            Element root = doc.getDocumentElement();
            Element detailsElement = (Element) root.getElementsByTagName("details").item(0);
            Element contactElement = (Element) root.getElementsByTagName("contact").item(0);

            String websiteName = detailsElement.getElementsByTagName("name").item(0).getTextContent();
            String description = detailsElement.getElementsByTagName("description").item(0).getTextContent();
            String email = contactElement.getElementsByTagName("email").item(0).getTextContent();
            String phone = contactElement.getElementsByTagName("phone").item(0).getTextContent();
            String address = contactElement.getElementsByTagName("address").item(0).getTextContent();

            request.setAttribute("websiteName", websiteName);
            request.setAttribute("description", description);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Profile.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}