import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    let scrollPosition = window.scrollY;
    const header = document.getElementsByTagName("header")[0];
    const meetingSection = document.getElementById("meeting");
    const vh = Math.max(
      document.documentElement.clientHeight || 0,
      window.innerHeight || 0
    );

    if (meetingSection) {
      window.addEventListener("scroll", function () {
        scrollPosition = window.scrollY;

        if (scrollPosition >= vh - 64) {
          header.classList.remove("border-transparent");
          header.classList.add("border-brandy-rose");
        }
        else {
          header.classList.remove("border-brandy-rose");
          header.classList.add("border-transparent");
        }
      });
    }

  }
}
