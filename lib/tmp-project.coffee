path = require 'path'
mkdirp = require 'mkdirp'
moment = require 'moment'

module.exports =
  config:
    basePath:
      title: 'Base path'
      type: 'string'
      default: path.join(atom.getConfigDirPath(), '.tmp-projects')

  activate: ->
    atom.commands.add 'atom-workspace', 'tmp-project:open', => @open()

  open: ->
    baseDir = atom.config.get('tmp-project.basePath')
    name = moment().format 'YYYYMMDD-HHmmss'
    tmpDirPath = path.join(baseDir, name)
    mkdirp tmpDirPath, (err) ->
      console.error err
      atom.open({ pathsToOpen: [tmpDirPath] })
