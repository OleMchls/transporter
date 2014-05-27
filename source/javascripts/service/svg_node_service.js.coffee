transporterApp = angular.module 'transporter'

# From: http://jasonmore.net/angular-js-svg-directives-ng-repeat-templates/
# Thank you! <3 <3 <3
transporterApp.service 'SVGNodeService', ->
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
