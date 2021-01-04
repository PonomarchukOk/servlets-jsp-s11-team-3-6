package com.softserve.itacademy.controller;

import com.softserve.itacademy.repository.TaskRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TasksListServlet", value = "/tasks-list")
public class TasksListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("repository", TaskRepository.getTaskRepository());
        request.getRequestDispatcher("/WEB-INF/pages/tasks-list.jsp").forward(request, response);
    }
}
