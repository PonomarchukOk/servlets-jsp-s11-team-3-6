package com.softserve.itacademy.controller;

import com.softserve.itacademy.model.Priority;
import com.softserve.itacademy.model.Task;
import com.softserve.itacademy.repository.TaskRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CreateTaskServlet", value = "/create-task")
public class CreateTaskServlet extends HttpServlet {

    private TaskRepository taskRepository;

    @Override
    public void init() {
        taskRepository = TaskRepository.getTaskRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/create-task.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (taskRepository.create(new Task(
                request.getParameter("name"),
                Priority.valueOf(request.getParameter("priority").toUpperCase())
        ))) request.setAttribute("message", "Task successfully created.");
        else request.setAttribute("message", "Task with given name already exists!");
        request.getRequestDispatcher("/WEB-INF/pages/create-task.jsp").forward(request, response);
    }
}
