transporterApp = angular.module 'transporter'

# From: http://jasonmore.net/angular-js-svg-directives-ng-repeat-templates/
# Thank you! <3 <3 <3
# Check also this: http://stackoverflow.com/questions/13641105/including-svg-template-in-angularjs-directive
transporterApp.service 'SVGNodeService', ->
  xmlns = "http://www.w3.org/2000/svg"
  compileNode = (angularElement) ->
    rawElement = angularElement[0]

    #new lines have no localName
    unless rawElement.localName
      text = document.createTextNode(rawElement.wholeText)
      return angular.element(text)

    replacement = document.createElementNS(xmlns, rawElement.localName)
    children = angularElement.children()
    angular.forEach children, (value) ->
      newChildNode = compileNode(angular.element(value))
      replacement.appendChild newChildNode[0]
      return

    replacement.textContent = rawElement.innerText  if rawElement.localName is "text"
    attributes = rawElement.attributes
    i = 0

    while i < attributes.length
      replacement.setAttribute attributes[i].name, attributes[i].value
      i++

    angularElement.replaceWith replacement
    angular.element replacement


  createSVGNode: (name, scope, settings) ->
    namespace = "http://www.w3.org/2000/svg"
    node = document.createElementNS(namespace, name)
    for attribute of settings
      value = settings[attribute]

      continue if not value? or attribute.match(/\$/)

      if (typeof value isnt "string")
        node.setAttribute attribute, value
      else if value isnt ""
        # Needs to have it's own binding to avoid `attribute` to become something
        # else on the next loop :/
        (->
            currentAttribute = attribute
            scope.$watch value, (newValue, oldValue) ->
              node.setAttribute(currentAttribute, newValue)
        )()

    node

  compile: (elem, attrs, transclude) ->
    replacement = compileNode(elem)
    postLink = (scope, elem, attrs, controller) ->
      # console.log('link called');
