# HoloViz-Quarto

The purpose of this project is to **make it easy to use the HoloViz ecosystem with Quarto**.

**Check out the [holoviz-quarto Documentation](https://awesome-panel.github.io/holoviz-quarto/)** to get inspired.

<img src="https://holoviz.org/_static/holoviz-logo-unstacked.svg" style="height: 50px;margin-right:10px"> <img src="https://quarto.org/quarto.png" style="height: 50px;margin-right:10px">

## Disclaimer

This is currently an **experiment** only. When its matured I hope it can become an official HoloViz project.

## Development

```bash
git clone https://github.com/awesome-panel/holoviz-quarto
conda create -n holoviz-quarto conda-forge r-quarto perl matplotlib panel hvplot jupyter
```

To setup your development environment and learn more about quarto development check out the [Quarto Lua Development Guide](https://quarto.org/docs/extensions/lua.html).

### Deployment

Run

```bash
quarto publish gh-pages
```

### Resources

- [Creating Quarto Extensions](https://quarto.org/docs/extensions/creating.html)
- [Quarto Extensions](https://quarto.org/docs/extensions/listing-filters.html)
  - [shinylive extension](https://github.com/quarto-ext/shinylive)
  - [stlite extension](https://github.com/whitphx/quarto-stlite)
