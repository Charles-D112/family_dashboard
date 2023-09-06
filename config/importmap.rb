# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min", preload: true
pin "@hotwired/stimulus", to: "stimulus.min", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min", preload: true
pin "@popperjs/core", to: "popper", preload: true
