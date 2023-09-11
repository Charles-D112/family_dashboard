import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["footer", "buttonImage"];

  toggleFooter() {
    this.footerTarget.classList.toggle("visible");
    this.buttonImageTarget.classList.toggle("rotate");
  }
}
