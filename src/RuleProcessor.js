(function() {
  var RuleProcessor, regexes;

  regexes = {
    englishOperators: /and|or|isnt|is|not/
  };

  module.exports = RuleProcessor = (function() {
    function RuleProcessor() {}

    RuleProcessor.prototype.rule = {
      name: 'prefer_symbol_operator',
      description: 'This rule prohibits not, and, or, is, and isnt.\nUse !, &&, ||, ==, and != instead.',
      level: 'warn',
      message: 'Don\'t use not, and, or, is, and isnt'
    };

    RuleProcessor.prototype.lintLine = function(line, lineApi) {
      var hasEnglishOperators, lineTokens, location, substring, token, _i, _len, _ref;
      lineTokens = lineApi.getLineTokens();
      for (_i = 0, _len = lineTokens.length; _i < _len; _i++) {
        token = lineTokens[_i];
        if ((_ref = token[0]) === 'COMPARE' || _ref === 'LOGIC' || _ref === 'UNARY') {
          location = token[2];
          substring = line.slice(location.first_column, +location.last_column + 1 || 9e9);
          hasEnglishOperators = substring.match(regexes.englishOperators);
          if (hasEnglishOperators) {
            return {
              context: "Found: " + hasEnglishOperators[0]
            };
          }
        }
      }
    };

    return RuleProcessor;

  })();

}).call(this);
