import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="orders"
export default class extends Controller {
  connect() {
    console.log("Hello, orders Stimulus!", this.element)
  }

  // order refresh select fields
  refresh(event) {
    console.log("refreshing order")
    console.log(event.params)
  }
}
