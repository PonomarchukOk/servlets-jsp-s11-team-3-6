package com.softserve.itacademy.controller;

import com.softserve.itacademy.model.Priority;
import com.softserve.itacademy.model.Task;
import com.softserve.itacademy.repository.TaskRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/edit-task", name = "EditTaskServlet")
public class EditTaskServlet extends HttpServlet {

    private TaskRepository taskRepository;

    @Override
    public void init() {
        taskRepository = TaskRepository.getTaskRepository();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            Task task = taskRepository.read(Integer.parseInt(idStr));
            if (task != null) {
                req.setAttribute("task", task);
                req.getRequestDispatcher("/WEB-INF/pages/edit-task.jsp").forward(req, resp);
            } else {
                req.setAttribute("error-code", "404");
                req.setAttribute("task-id", idStr);
                req.setAttribute("from-url", "/edit-task");
                getServletContext().getRequestDispatcher("/error-page").forward(req, resp);
            }
        } else {
            resp.sendError(400, "Bad req");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("name");
        Priority prio = Priority.valueOf(req.getParameter("priority").toUpperCase());

        Task task = taskRepository.read(id);
        task.setTitle(title); task.setPriority(prio);
        taskRepository.update(task);

        resp.sendRedirect(req.getContextPath() + "/tasks-list");
    }
}
