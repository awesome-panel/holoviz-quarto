function iframeLoaded(el) {
  console.log(el)
  if(el) {
        console.log("iframe loaded")
        updateHeight(el)
  }   
}
function updateHeight(el){
  root = el.contentWindow.document.querySelector('[data-root-id]')
  child = root.firstChild
  if (child){
    el.height = "";
    el.height = child.scrollHeight + "px";
  } else {
    setTimeout(updateHeight, 100, el)
  }
}
