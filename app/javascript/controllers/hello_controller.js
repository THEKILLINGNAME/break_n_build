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
          header.classList.remove("bg-mine-shaft");
          header.classList.add("bg-blue-500");
        } else {
          header.classList.remove("bg-blue-500");
          header.classList.add("bg-mine-shaft");
        }
      });
    }
  }
}
