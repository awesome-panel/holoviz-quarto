function resizePanelApp(el) {
  console.log(el)
  if(el) {
        console.log("iframe loaded")
        updatePanelAppHeight(el)
  }   
}
function updatePanelAppHeight(el){
  root = el.contentWindow.document.querySelector('[data-root-id]')
  child = root.firstChild
  if (child){
    el.height = "";
    el.height = child.scrollHeight + "px";
  } else {
    setTimeout(updatePanelAppHeight, 100, el)
  }
}
