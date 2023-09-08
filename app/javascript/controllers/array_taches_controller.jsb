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
      const taskCard = `<div class="task-card" data-task="${taskName}">${taskName}</div>`;
      this.taskListTarget.insertAdjacentHTML("beforeend", taskCard);
    } else {
      const taskCardToRemove = this.taskListTarget.querySelector(`.task-card[data-task="${taskName}"]`);
      if (taskCardToRemove) {
        taskCardToRemove.remove();
      }
    }
  }

  updateTaskList() {
    const tasks = this.inputTargets.map(input => input.value);
    const taskListHTML = tasks.map(task => `<div class="task-card" data-task="${task}">${task}</div>`).join('');
    this.taskListTarget.innerHTML = taskListHTML;
  }

  addManualTask() {
    const manualTaskInput = document.getElementById('manual-task-input');
    const manualTaskName = manualTaskInput.value.trim();
    if (manualTaskName !== "") {
      const taskCard = `<div class="task-card" data-task="${manualTaskName}">${manualTaskName}</div>`;
      this.taskListTarget.insertAdjacentHTML("beforeend", taskCard);
      manualTaskInput.value = "";
    }
  }
}
