import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["toggle"];
  static values = { listId: Number };

  connect() {
    console.log("Contrôleur Stimulus connecté !");

    const taskToggles = this.element.querySelectorAll(".task-toggle");
    taskToggles.forEach(toggle => {
      toggle.addEventListener("click", () => {
        const taskId = toggle.dataset.taskId;
        const taskElement = this.element.querySelector(`[data-task-id="${taskId}"]`);
        const status = toggle.checked;

        this.updateTaskStatus(taskId, status);
      });
    });
  }

  updateTaskStatus(taskId, status) {
    console.log("check updateStatus")
    const listId = this.listIdValue;
    fetch(`/lists/${listId}/tasks/${taskId}/complete_task`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({ done: status })
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        console.log('Task status updated successfully.');
      } else {
        console.error('Error updating task status.');
      }
    });
  }
}
