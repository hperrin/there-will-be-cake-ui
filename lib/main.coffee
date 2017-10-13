root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe 'there-will-be-cake-ui.colorScheme', (value) ->
      setColorScheme(value)

    # DEPRECATED: This can be removed at some point (added in Atom 1.17/1.18ish)
    # It removes `layoutMode`
    if atom.config.get('there-will-be-cake-ui.layoutMode')
      atom.config.unset('there-will-be-cake-ui.layoutMode')

  deactivate: ->
    unsetColorScheme()


# Color Scheme -----------------------

setColorScheme = (colorScheme) ->
  root.setAttribute('theme-there-will-be-cake-ui-colorscheme', colorScheme.toLowerCase().replace(/ /, '-'))

unsetColorScheme = ->
  root.removeAttribute('theme-there-will-be-cake-ui-colorscheme')
