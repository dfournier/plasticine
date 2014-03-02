require.config
  packages: [
    {
      name: 'lodash'
      location: '../components/lodash-amd/modern'
    }
  ]
  paths:
    'chai'         : '../components/chai/chai'
    'sinon-chai'   : '../components/sinon-chai/lib/sinon-chai'
    'sinon'        : '../components/sinon/pkg/sinon-1.7.3'
    'jquery'       : '../components/jquery/dist/jquery'
    'plasticine'   : '../app/plasticine'
    'crossroads'   : '../components/crossroads.js/dist/crossroads'
    'signals'      : '../components/crossroads.js/dev/lib/signals'
    'custom-sinon' : '../components/custom_sinon'
  shim:
    'sinon':
      exports: "sinon"

files = [
  'jquery'
  'chai'
  'sinon-chai'
  'sinon'
]


`var main_node = // main_node_var_here`

get_files = (path, node) ->
  out = []
  new_path = path + node.name + '/'
  out.push new_path + file for file in node.files
  for directory in node.directories
    out = out.concat get_files(new_path, directory)
  return out
specs = get_files '', main_node

capitalize = (s) ->
  s.charAt(0).toUpperCase() + s[1...]

get_requires = (path, node, is_base = false) -> ->
  new_path = path + node.name + '/'
  name = if is_base then "" else capitalize node.name
  describe name, ->
    for file in node.files
      require(new_path + file)()
    for directory in node.directories
      get_requires(new_path, directory)()


require files, ->
  chai = require("chai")
  sinonChai = require("sinon-chai")

  should = chai.should()

  chai.use(sinonChai);
  mocha.setup
    globals: ['should', 'sinon']

  require specs, ->
    describe '', ->
      before (done) ->
        xhr = sinon.useFakeXMLHttpRequest()
        xhr.onCreate = (request) =>
          request.respondHelper = (status, data) ->
            request.respond(
              status
              {"Content-Type": "application/json"}
              JSON.stringify data)
          @requests.push(request)

        require ['plasticine'], (plasticine) =>
          @plasticine = plasticine
          done()

      beforeEach ->
        @requests = []

      get_requires('', main_node, true)()

    mocha.run()