local stlite_sharing_url = "https://share.stlite.net/"

function CodeBlock(el)
  if el.attr and el.attr.classes:find_if(function (c) return string.match(c, "{?panel%-python}?") end) then
    local str = [[import html
from io import StringIO
import sys  

from panel.io.convert import script_to_html
py = sys.stdin.read()
ht, _ = script_to_html( 
    StringIO(py), runtime="pyscript"
)
ht=ht.replace('<body', '<script type="text/javascript" src="https://raw.githubusercontent.com/davidjbradshaw/iframe-resizer/master/js/iframeResizer.contentWindow.min.js"></script><body')
ht = html.escape(ht)
print(f"<iframe srcdoc='{ht}' class='panel' onload='iframeLoaded(this)'></iframe>")]]
      converted_code = pandoc.pipe("python", {"-c", str}, el.text)
      print(converted_code)
      quarto.doc.add_html_dependency(
        {
          name = "panel-python",
          stylesheets = {"style.css"},
          scripts = {"iframeResizer.min.js", "panel-quarto.js"},
        }
      )

      return pandoc.RawBlock("html", converted_code)
  end
end
