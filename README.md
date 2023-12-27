# Quarto-HoloViz

The purpose of this project is to make it easy to use Panel and the rest of the HoloViz ecosystem with Quarto.

We do this by providing *how-to* guides as well as Quarto extensions.

<img src="https://panel.holoviz.org/_static/logo_horizontal_light_theme.png" style="height: 30px;margin-right:10px"> <img src="https://holoviz.org/_static/holoviz-logo-unstacked.svg" style="height: 30px;margin-right:10px"> <img src="https://quarto.org/quarto.png" style="height: 30px;margin-right:10px"> <img src="https://pyscript.net/assets/images/pyscript-sticker-black.svg" style="height: 30px;margin-right:10px">

![Panel in Quarto Example](assets/gifs/example.gif)

DISCLAIMER: THIS IS **AN EXPERIMENT ONLY**. THE API MIGHT CHANGE. I DON'T WANT TO BE THE MAINTAINER OF THIS! I HOPE IT WILL BE A HOLOVIZ MAINTAINED PROJECT ONE DAY.

## Prerequisities

- Quarto. Check out their [Getting Started Guide](https://quarto.org/docs/get-started/).
- A Python environment.
  - `jupyter`, `panel` and the packages you will be using in your Quarto documents should be installed.

If you are a `conda` user, then you can install everything you need via

```bash
conda create -n quarto-holoviz -c conda-forge python=3.11 r-quarto perl hvplot matplotlib panel jupyter
```

or similar

## Installing

You can install the `quarto-holoviz` extension in your quarto project via

```bash
quarto add awesome-panel/quarto-holoviz
```

This will install the extension under the `_extensions` subdirectory. If you're using version control, you will want to check in this directory.

## Using

Put this in the header of your document, or in the `_quarto.yml` file:

```yaml
filters:
  - holoviz/quarto
```

Then you can put the code for a Panel application in a code block marked with {panel-convert-python}.

````markdown
---
title: Panel in Quarto Examples
format: html
filters:
  - holoviz/quarto
---

This is a Panel application embedded in a Quarto doc.

```{panel-convert-python}
import panel as pn

pn.extension(design="material")

slider = pn.widgets.IntSlider(name="Select a value", value=10, start=0, end=100)
pn.Column(
    "# Hello Panel + Quarto!",
    pn.rx("You selected: {}").format(slider),
).servable()
```
````

![Example Quarto Document](assets/gifs/example-readme.gif)

## Reference Guides

The below *code block* filters can be used with the HoloViz ecosystem.

| Reference| Filter | Extension | Description  |
| - | - | - | - |
| [`{panel-convert-python}`](example-panel-convert-python.qmd) | `panel-convert-python` | `holoviz/quarto` | How-to use use the `{panel-convert-python}` filter |
| [PyScript](example-pyscript.qmd) |  |  | How to use Panel with Pyscript |
| [`{pyscript}`](example-python.qmd) | `python` |  | How-to use the `{python}` filter |

## Development

```bash
git clone https://github.com/awesome-panel/quarto-holoviz
conda create -n quarto-holoviz conda-forge r-quarto perl matplotlib panel hvplot jupyter
```

To setup your development environment and learn more about quarto development check out the [Quarto Lua Development Guide](https://quarto.org/docs/extensions/lua.html).

To preview an example run one of

```bash
quarto preview example-panel-convert-python.qmd --port 5008
quarto preview example-pyscript.qmd --port 5008
quarto preview example-python.qmd --port 5008
```

## Resources

- [Creating Quarto Extensions](https://quarto.org/docs/extensions/creating.html)
- [Quarto Extensions](https://quarto.org/docs/extensions/listing-filters.html)
  - [shinylive extension](https://github.com/quarto-ext/shinylive)
  - [stlite extension](https://github.com/whitphx/quarto-stlite)
