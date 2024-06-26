const { invoke } = window.__TAURI__.tauri;

let greetInputEl;
let greetMsgEl;
// Créez une nouvelle instance de l'objet Audio
let audio = new Audio('assets/RihannaSOS.mp3');

function playSong() {
  audio.play();
}

async function greet() {
  // Learn more about Tauri commands at https://tauri.app/v1/guides/features/command
  greetMsgEl.textContent = await invoke("greet", { name: greetInputEl.value });
  playSong();
}

window.addEventListener("DOMContentLoaded", () => {
  greetInputEl = document.querySelector("#greet-input");
  greetMsgEl = document.querySelector("#greet-msg");
  document.querySelector("#greet-form").addEventListener("submit", (e) => {
    e.preventDefault();
    greet();
  });
});
