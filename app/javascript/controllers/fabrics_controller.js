import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fabrics"
export default class extends Controller {
  connect() {
    console.log("Hello, fabrics Stimulus!", this.element)
  }
}
