module.exports =
class Utils
  @stringIsBlank: (str)->
    !str or /^\s*$/.test str
