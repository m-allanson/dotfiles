# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

# Change tab title: https://gist.github.com/dhbradshaw/fcd67df6564eae64a0a5
atom.workspace.observeTextEditors (editor) ->
    if editor.getTitle() isnt "untitled"
        sp = editor.getPath().split('/')
        title = sp.slice(sp.length-2).join('/')
        editor.getTitle = -> title
        editor.getLongTitle = -> title

for item in atom.workspace.getPaneItems()
    if item.emitter?
        item.emitter.emit "did-change-title", item.getTitle()