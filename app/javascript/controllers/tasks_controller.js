import { Controller } from "@hotwired/stimulus"

const tasks = []

export default class extends Controller {

  static targets = ["taskList", "newTaskInput", "newTaskForm", "taskNames"]

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
    this.taskNamesTarget.value = tasks.join('<br>');
    event.target.submit();
  }

  #addTaskToList(taskName) {
    tasks.push(taskName);
    this.#updateTaskList()
  }

  #removeTaskFromList(taskName) {
    const index = tasks.indexOf(taskName);
    tasks.splice(index, 1);
    this.#updateTaskList()
  }

  #updateTaskList() {
    const taskListHTML = tasks.map(task => `<p>${task}</p>`).join('');
    this.taskListTarget.innerHTML = taskListHTML;
  }
}