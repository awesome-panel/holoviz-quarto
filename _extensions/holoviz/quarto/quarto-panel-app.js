function iframeLoaded(el) {
  console.log(el)
  if(el) {
        console.log("iframe loaded")
        updateHeight(el)
  }   
}
function updateHeight(el){
  inner = el.contentWindow.document.getElementsByClassName("bk-panel-models-layout-Column")[0]
  if (inner){
    inner = el.contentWindow.document.getElementsByClassName("bk-panel-models-layout-Column")[0]
    el.height = "";
    el.height = inner.scrollHeight + "px";
  } else {
    setTimeout(updateHeight, 100, el)
  }
}
