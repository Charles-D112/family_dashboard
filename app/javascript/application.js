// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
//= require_tree .

document.addEventListener("DOMContentLoaded", function () {
  // Sélectionnez toutes les cases à cocher avec la classe "task-toggle"
  const taskToggles = document.querySelectorAll(".task-toggle");

  // Parcourez chaque case à cocher
  taskToggles.forEach((toggle) => {
    // Ajoutez un gestionnaire d'événement "change" à chaque case à cocher
    toggle.addEventListener("change", function () {
      const taskId = this.dataset.taskId; // Obtenez l'identifiant de la tâche depuis les données HTML
      const taskElement = document.querySelector(`[data-task-id="${taskId}"]`); // Trouvez l'élément de la tâche par son ID

      if (taskElement) {
        // Si l'élément de la tâche existe
        if (this.checked) {
          // Si la case à cocher est cochée, masquez l'élément de la tâche
          taskElement.style.display = "none";
        } else {
          // Si la case à cocher est décochée, réaffichez l'élément de la tâche
          taskElement.style.display = "block";
        }
      }
    });
  });
});
