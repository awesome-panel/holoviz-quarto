# Quarto HoloViz Extension

The purpose of this repository is to provide Quarto Extensions that enables users of the HoloViz
ecosystem to include their Plots and Panel Apps in Quarto Documents.

The focus is on including the plots and app in a way such that they are live and interactive,
powered by Pyodide or PyScript.

DISCLAIMER: THIS IS AN EXPERIMENT ONLY. I DON'T WANT TO BE THE MAINTAINER OF THIS! IF ITS VALUABLE
I HOPE IT WILL BE A HOLOVIZ MAINTAINED PROJECT ONE DAY.

## Prerequisities

- Quarto and a Quarto project. Check out their [Getting Started Guide](https://quarto.org/docs/get-started/).
- A Python environment. The packages you will be using in your Quarto documents should be installed.

## Installing

You can install the `quarto-holoviz` extension in your quarto project via

```bash
quarto add MarcSkovMadsen/quarto-holoviz
```

This will install the extension under the `_extensions` subdirectory. If you're using version control, you will want to check in this directory.

## Using

Put this in the header of your document, or in the `_quarto.yml` file:

```yaml
filters:
  - holoviz/panel-app
```

Then you can put the code for a Panel application in a code block marked with {panel-app}.

````markdown
---
title: Panel in Quarto Examples
format: html
filters:
  - holoviz/panel-app
---

This is a Panel application embedded in a Quarto doc.

```{panel-app}
import panel as pn

pn.extension(design="material")

slider = pn.widgets.IntSlider(name="Select a value", value=10, start=0, end=100)
pn.Column(
    "# Hello Panel + Quarto!",
    pn.rx("You selected: {}").format(slider),
).servable()
```
````

## Filters

Below we list the code block markers

| Name | Extension | Description |
| - | - | - | 
| `panel-app` | `holoviz/panel-app` | A filter for including Panel apps using `.servable` |

### Panel-Quarto Extension Issues

- We need to find a robust way to get the Panel iframe to resize its height
  - on load
  - if the height changes of the iframe content changes. For example if more elements are generated dynamically by the user.

Also Panel convert has some issue

- `--to pyodide-worker` seems not to work
- some of the material and fast assets are not loaded via cdn

## Resources

- [Creating Quarto Extensions](https://quarto.org/docs/extensions/creating.html)
- [Quarto Extensions](https://quarto.org/docs/extensions/listing-filters.html)
  - [shinylive extension](https://github.com/quarto-ext/shinylive)
  - [stlite extension](https://github.com/whitphx/quarto-stlite)
