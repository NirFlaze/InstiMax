import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bio", "counter"]

  connect() {
    this.update()
  }

  update() {
    this.counterTarget.textContent = this.bioTarget.value.length
  }
}