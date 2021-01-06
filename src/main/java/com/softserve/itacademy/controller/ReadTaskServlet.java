package com.softserve.itacademy.controller;

import com.softserve.itacademy.model.Task;
import com.softserve.itacademy.repository.TaskRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReadTaskServlet", value = "/read-task")
public class ReadTaskServlet extends HttpServlet {
    private TaskRepository taskRepository;

    @Override
    public void init() {
        taskRepository = TaskRepository.getTaskRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            Task task = taskRepository.read(Integer.parseInt(idStr));
            if (task != null) {
                request.setAttribute("task", task);
                request.getRequestDispatcher("/WEB-INF/pages/read-task.jsp").forward(request, response);
            } else {
                request.setAttribute("error-code", "404");
                request.setAttribute("task-id", idStr);
                request.setAttribute("from-url", "/read-task");
                getServletContext().getRequestDispatcher("/error-page").forward(request, response);
            }
        } else {
            response.sendError(400, "Bad Request");
        }
    }
}
