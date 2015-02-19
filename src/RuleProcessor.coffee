regexes =
  englishOperators: /and|or|isnt|is|not/

module.exports = class RuleProcessor
  rule:
    name: 'prefer_symbol_operator'
    description: '''
      This rule prohibits not, and, or, is, and isnt.
      Use !, &&, ||, ==, and != instead.
      '''
    level: 'warn'
    message: "Don't use not, and, or, is, and isnt"

  lintLine: (line, lineApi) ->
    lineTokens = lineApi.getLineTokens()

    for token in lineTokens
      if token[0] in ['COMPARE', 'LOGIC', 'UNARY']
        location = token[2]
        substring = line[location.first_column..location.last_column]
        hasEnglishOperators = substring.match regexes.englishOperators
        if hasEnglishOperators
          return {context: "Found: #{hasEnglishOperators[0]}"}
