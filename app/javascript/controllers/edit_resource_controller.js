import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "infos", "form", "icons" ]

  connect() {
  }
  displayForm(e) {
    // this.infosTarget.classList.add('d-none');
    // this.formTarget.classList.remove('d-none');
    const index = e.currentTarget.dataset.index

    if(!index) {
      this.infosTargets[0].classList.add('d-none');
      this.formTargets[0].classList.remove('d-none');
    } else {
      this.infosTargets[Number(index) + 1].classList.add('d-none');
      this.formTargets[Number(index) + 1].classList.remove('d-none');
      this.iconsTargets[Number(index)].classList.add('d-none');
    }
  }

  update() {
    console.log("hello")
  }
}
