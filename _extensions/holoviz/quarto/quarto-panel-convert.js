function resizePanelApp(el) {
  if(el) {
        updatePanelAppHeight(el)
  }   
}
function updatePanelAppHeight(el){
  child=null
  extra_height = 0
  no_template_el = el.contentWindow.document.querySelector('[data-root-id]')
  console.log(no_template_el)
  fast_template_el = el.contentWindow.document.querySelector('fast-design-system-provider#body-design-provider')
  console.log(fast_template_el)
  if (fast_template_el){
    child = fast_template_el
    extra_height = 50
  } else if (no_template_el) {
    child = no_template_el.firstChild
  }
    
  if (child){
    el.height = "";
    el.height = child.scrollHeight + extra_height + "px";
  } else {
    setTimeout(updatePanelAppHeight, 100, el)
  }
}
