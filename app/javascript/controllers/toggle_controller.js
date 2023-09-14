import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const taskToggles = this.element.querySelectorAll(".task-toggle");

    taskToggles.forEach((toggle) => {
      toggle.addEventListener("change", () => {
        const taskId = toggle.dataset.taskId;
        const taskElement = this.element.querySelector(`[data-task-id="${taskId}"]`);

        if (taskElement) {
          if (toggle.checked) {
            taskElement.style.display = "none";
          } else {
            taskElement.style.display = "block";
          }
        }
      });
    });
  }
}
