import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "taskList", "checkbox"]

  connect() {
    this.updateTaskList()
  }

  toggleTask(event) {
    const checkbox = event.target;
    const taskName = checkbox.dataset.value;

    if (checkbox.checked) {

      this.addTaskToList(taskName);
    } else {

      this.removeTaskFromList(taskName);
    }
  }

  updateTaskList() {
    const tasks = this.inputTargets.map(input => input.value);
    const manualTaskInput = document.getElementById('manual-task-input');
    const manualTaskName = manualTaskInput.value.trim();
    if (manualTaskName !== "") {
      // Récupérez l'élément d'entrée des tâches manuelles dans le formulaire
      const tasksInput = document.querySelector('input[name="list[tasks][]"]');
      // Définissez la valeur de l'élément d'entrée des tâches avec la tâche manuelle
      tasksInput.value = manualTaskName;
      // Ajoutez la tâche manuelle à la liste des tâches
      this.addTaskToList(manualTaskName);
      manualTaskInput.value = "";
    }
    const taskListHTML = tasks.map(task => `<div class="task-card" data-task="${task}">${task}</div>`).join('');
    this.taskListTarget.innerHTML = taskListHTML;
  }

  addTaskToList(taskName) {
    const taskCard = `<div class="task-card" data-task="${taskName}">${taskName}</div>`;
    this.taskListTarget.insertAdjacentHTML("beforeend", taskCard);
  }

  removeTaskFromList(taskName) {
    const taskCardToRemove = this.taskListTarget.querySelector(`.task-card[data-task="${taskName}"]`);
    if (taskCardToRemove) {
      taskCardToRemove.remove();
    }
  }

  addManualTask() {
    const manualTaskInput = document.getElementById('manual-task-input');
    const manualTaskName = manualTaskInput.value.trim();
    if (manualTaskName !== "") {

      this.addTaskToList(manualTaskName);
      manualTaskInput.value = "";
    }
  }
}
