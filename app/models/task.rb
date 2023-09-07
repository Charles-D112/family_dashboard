class Task < ApplicationRecord
  belongs_to :list, optional: true
  belongs_to :executor, class_name: "User", optional: true
  belongs_to :owner, class_name: "User"
  belongs_to :tuto, optional: true

  GENERIC_TASKS = [
    "Faire la vaisselle",
    "Passer l'aspirateur",
    "Faire la poussière",
    "Faire les lits",
    "Nettoyer la salle de bains",
    "Laver les sols",
    "Faire la lessive",
    "Sortir les poubelles",
    "Nourrir les animaux",
    "Faire les courses"
  ]
end
