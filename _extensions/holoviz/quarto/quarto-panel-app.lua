function CodeBlock(el)
  if el.attr and el.attr.classes:find_if(function (c) return string.match(c, "{?panel%-app%-python}?") end) then
    local str = [[import html
from io import StringIO
import sys  

from panel.io.convert import script_to_html
py = sys.stdin.read()
ht, _ = script_to_html( 
    StringIO(py), runtime="pyscript"
)
ht = html.escape(ht)
print(f"<iframe srcdoc='{ht}' class='panel-app' onload='iframeLoaded(this)'></iframe>")]]
      converted_code = pandoc.pipe("python", {"-c", str}, el.text)
      print(converted_code)
      quarto.doc.add_html_dependency(
        {
          name = "panel-python",
          stylesheets = {"quarto-panel.css"},
          scripts = {"quarto-panel-app.js"},
        }
      )

      return pandoc.RawBlock("html", converted_code)
  end
end
