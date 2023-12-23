# Panel docs experiments

## Quarto

To install

```bash
conda install -c conda-forge r-quarto pearl
```

To preview

```bash
quarto preview example.qmd
```

Check [_extensions/holoviz/panel-quarto/panel.lua](_extensions/holoviz/panel-quarto/panel.lua)

### Panel-Quarto Extension Issues

- We need to find a robust way to get the Panel iframe to resize its height
  - on load
  - if the height changes of the iframe content changes. For example if more elements are generated dynamically by the user.

Also Panel convert has some issue

- `--to pyodide-worker` seems not to work
- some of the material and fast assets are not loaded via cdn