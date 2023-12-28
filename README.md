# Quarto-HoloViz

The purpose of this project is to make it easy to use Panel and the rest of the HoloViz ecosystem with Quarto.

We do this by providing *how-to* guides as well as Quarto extensions.

<img src="https://holoviz.org/_static/holoviz-logo-unstacked.svg" style="height: 50px;margin-right:10px"> <img src="https://quarto.org/quarto.png" style="height: 50px;margin-right:10px">

![Panel in Quarto Example](assets/gifs/example.gif)

DISCLAIMER: THIS IS **AN EXPERIMENT ONLY**. THE API MIGHT CHANGE. I DON'T WANT TO BE THE MAINTAINER OF THIS! I HOPE IT WILL BE A HOLOVIZ MAINTAINED PROJECT ONE DAY.

## Prerequisities

You can install everything you need with Conda

```bash
conda create -n quarto-holoviz -c conda-forge python=3.11 r-quarto perl jupyter panel hvplot matplotlib
```

This will

- Create a Python environment named `quarto-holoviz`.
- Install Quarto and its dependencies perl and jupyter
- Install `panel` and other Python packages

For alternative installation methods checkout the [Quarto Getting Started Guide](https://quarto.org/docs/get-started/).

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

## Development

```bash
git clone https://github.com/awesome-panel/quarto-holoviz
conda create -n quarto-holoviz conda-forge r-quarto perl matplotlib panel hvplot jupyter
```

To setup your development environment and learn more about quarto development check out the [Quarto Lua Development Guide](https://quarto.org/docs/extensions/lua.html).

### Deployment

Run

```bash

```

### Resources

- [Creating Quarto Extensions](https://quarto.org/docs/extensions/creating.html)
- [Quarto Extensions](https://quarto.org/docs/extensions/listing-filters.html)
  - [shinylive extension](https://github.com/quarto-ext/shinylive)
  - [stlite extension](https://github.com/whitphx/quarto-stlite)
