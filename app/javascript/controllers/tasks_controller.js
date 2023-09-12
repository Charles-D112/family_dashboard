import { Controller } from '@hotwired/stimulus';

const completedTasks = new Set(); // Utilisez un ensemble pour stocker les tâches complétées

export default class extends Controller {
  static targets = ['taskName', 'taskStatus', 'taskList', 'newTaskInput', 'newTaskForm', 'taskNames'];

  connect() {
    // Écoutez les changements d'état des cases à cocher
    this.taskNameTargets.forEach((taskName) => {
      taskName.addEventListener('change', this.toggleTaskCompletion.bind(this));
      this.updateTaskStatus(taskName); // Mettez à jour l'état initial lors de la connexion
    });
  }

  toggleTaskCompletion(event) {
    const taskName = event.currentTarget;
    const taskStatus = taskName.nextElementSibling.querySelector('.task-status');
    if (taskName.checked) {
      taskStatus.style.display = 'inline';
      taskName.nextElementSibling.classList.add('completed');
    } else {
      taskStatus.style.display = 'none';
      taskName.nextElementSibling.classList.remove('completed');
    }
    // Mettez à jour l'ensemble completedTasks en fonction de l'état actuel de la case à cocher
    if (taskName.checked) {
      completedTasks.add(taskName.value);
    } else {
      completedTasks.delete(taskName.value);
    }
  }

  toggleGenericTask(event) {
    const taskName = event.target.value;
    tasks.includes(taskName) ? this.#removeTaskFromList(taskName) : this.#addTaskToList(taskName);
  }

  addManualTask(event) {
    event.preventDefault();
    const manualTaskName = this.newTaskInputTarget.value.trim();
    if (manualTaskName !== '') {
      this.#addTaskToList(manualTaskName);
      this.newTaskInputTarget.value = '';
    }
  }

  createList(event) {
    event.preventDefault();
    this.taskNamesTarget.value = Array.from(completedTasks);
    event.target.submit();
  }

  #addTaskToList(taskName) {
    completedTasks.add(taskName);
    this.#updateTaskList();
  }

  #removeTaskFromList(taskName) {
    completedTasks.delete(taskName);
    this.#updateTaskList();
  }

  #updateTaskList() {
    const taskListHTML = Array.from(completedTasks).map(task => `<p>${task}</p>`);
    this.taskListTarget.innerHTML = taskListHTML.join('<br>');
  }

  removeTask(event) {
    event.preventDefault();
    const taskNameToRemove = event.currentTarget.getAttribute('data-task-name');
    completedTasks.delete(taskNameToRemove);
    this.#updateTaskList();
  }
}
