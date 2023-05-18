import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  change(event) {
    if (event.target.value > 0) {
      event.target.form.elements.commit.classList.remove('disabled')
    } else {
      event.target.form.elements.commit.classList.add('disabled')
    }
  }

}
