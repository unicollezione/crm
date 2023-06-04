import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  validate(event) {
    if (
      event.target.form.elements.amount.valueAsNumber > 0 &&
      event.target.form.elements.email.value.match(/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/) ||
      event.target.form.elements.phone.value.match(/\d{11}/)
    ) {
      this.allowFormSubmit(event)
      this.assignHiddenFields(event)
    } else {
      this.disableFormSubmit(event)
    }
  }

  email(event) {
    this.validate(event)
  }

  phone(event) {
    this.validate(event)
  }

  allowFormSubmit(event) {
    event.target.form.elements.commit.disabled = false
  }

  disableFormSubmit(event) {
    event.target.form.elements.commit.disabled = true
  }

  assignHiddenFields(event) {
    const formElements = event.target.form.elements
    const formData = document.forms[0].elements

    formElements.full_name.value = formData.customer_id.textContent
    formElements.product.value = formData.product_id.textContent
    formElements.fabric.value = formData.fabric_id.textContent
    formElements.order.value = formData.order_idx.valueAsNumber
  }
}
