import { Controller } from "@hotwired/stimulus"

let tasks = []

export default class extends Controller {

  static values = {tasks: Array}
  static targets = ["taskList", "newTaskInput", "newTaskForm", "taskNames", "modal"]

  toggleGenericTask(event) {
    const taskName = event.target.value;
    tasks.includes(taskName) ? this.#removeTaskFromList(taskName) : this.#addTaskToList(taskName);
  }

  addManualTask(event) {
    event.preventDefault();
    const manualTaskName = this.newTaskInputTarget.value.trim();
    if (manualTaskName !== "") {
      this.#addTaskToList(manualTaskName);
      this.newTaskInputTarget.value = "";
    }
  }

  createList(event) {
    event.preventDefault();
    this.taskNamesTarget.value = tasks;
    event.target.submit();
  }

  #addTaskToList(taskName) {
    console.log(this.tasksValue);
    if (tasks.length === 0) {
    (tasks = this.tasksValue)};
    tasks.push(taskName);
    this.#updateTaskList()
  }

  #removeTaskFromList(taskName) {
    const index = tasks.indexOf(taskName);
    tasks.splice(index, 1);
    this.#updateTaskList();
  }

  #updateTaskList() {
    const taskListHTML = tasks.map(task => `<li class="task-list-item"><label style="color: black; text-decoration: none;">${task}</label><div class="field"><a href="#" class="btn btn-danger rounded-pill" data-turbo-method="delete" data-action="click->tasks#removeTaskFromList" data-task-name="${task}">Supprimer</a></div></li>`);
    const taskList = this.taskListTarget;

    taskListHTML.forEach(taskHTML => {
      const taskElement = document.createElement('div');
      taskElement.innerHTML = taskHTML;
      taskList.appendChild(taskElement.firstChild);
    });

    this.taskListTarget.innerHTML = taskListHTML.join("<br>");
  }

  openModal() {
    if (this.newTaskInputTarget.value.trim() !== "") {
      const modal = new bootstrap.Modal(this.modalTarget);
      modal.show();
    }
  }

  closeModal() {
    const modal = new bootstrap.Modal(this.modalTarget);
    modal.hide();
  }

  createTuto() {
    this.closeModal();
    window.location.href = "/tutos/new";
  }

}
