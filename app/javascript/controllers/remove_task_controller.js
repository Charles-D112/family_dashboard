import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="remove-task"
export default class extends Controller {
  static targets = ["task"];

  remove(event) {
    event.preventDefault();
    const taskId = event.currentTarget.dataset.taskId;
    const taskElement = this.taskTargets.find((element) =>
      element.dataset.taskId === taskId
    );

    // Effectuez une requête AJAX pour supprimer la tâche
    fetch(`/tasks/${taskId}`, {
      method: "DELETE",
    })
      .then((response) => {
        if (response.ok) {
          // Supprimez la tâche côté client
          taskElement.remove();
        } else {
          alert("Erreur lors de la suppression de la tâche.");
        }
      })
      .catch((error) => {
        console.error("Erreur lors de la suppression de la tâche.", error);
      });
  }
}
