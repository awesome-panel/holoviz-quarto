local file_path = debug.getinfo(1, "S").source:sub(2)
local file_dir = file_path:match("(.*[/\\])")
local script_to_iframe_path = file_dir .. "script_to_iframe.py"

function CodeBlock(el)
  if el.attr and el.attr.classes:find_if(function (c) return string.match(c, "{?panel%-app%-python}?") end) then
      converted_code = pandoc.pipe("python", {script_to_iframe_path}, el.text)
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
