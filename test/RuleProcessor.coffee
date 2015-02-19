require('coffee-script/register')

coffeelint = require 'coffeelint'
expect = require('chai').expect

PreferSymbolOperators = require '../src/RuleProcessor'

coffeelint.registerRule PreferSymbolOperators

configError = {prefer_symbol_operators: {level: 'error'}}

describe 'PreferSymbolOperators', ->
  describe 'English operators', ->
    it 'should warn when "is" is used', ->
      result = coffeelint.lint('1 is 1', configError)[0]
      expect(result).to.be.ok
      expect(result.context).to.equal 'Found: is'

    it 'should warn when "isnt" is used', ->
      result = coffeelint.lint('1 isnt 1', configError)[0]
      expect(result).to.be.ok
      expect(result.context).to.equal 'Found: isnt'

    it 'should warn when "and" is used', ->
      result = coffeelint.lint('1 and 1', configError)[0]
      expect(result).to.be.ok
      expect(result.context).to.equal 'Found: and'

    it 'should warn when "or" is used', ->
      result = coffeelint.lint('1 or 1', configError)[0]
      expect(result).to.be.ok
      expect(result.context).to.equal 'Found: or'

    it 'should warn when "not" is used', ->
      result = coffeelint.lint('not true', configError)[0]
      expect(result).to.be.ok
      expect(result.context).to.equal 'Found: not'

  describe 'Symbol operators', ->
    it "should not warn when '==' is used", ->
      expect(coffeelint.lint('1 == 1', configError).length).to.be.not.ok

    it "should not warn when '!=' is used", ->
      expect(coffeelint.lint('1 != 1', configError).length).to.be.not.ok

    it "should not warn when '&&' is used", ->
      expect(coffeelint.lint('1 && 1', configError).length).to.be.not.ok

    it "should not warn when '||' is used", ->
      expect(coffeelint.lint('1 || 1', configError).length).to.be.not.ok

    it "should not warn when '!' is used", ->
      expect(coffeelint.lint('! true', configError).length).to.be.not.ok

  describe 'Comments', ->
    it "should not warn when 'is' is used in a comment", ->
      expect(coffeelint.lint('# 1 is 1', configError).length).to.be.not.ok

  describe 'Variables', ->
    it "should not warn when 'is' is used in a variable", ->
      expect(coffeelint.lint('tis = 1', configError).length).to.be.not.ok
      expect(coffeelint.lint('issue = 1', configError).length).to.be.not.ok

  describe 'Strings', ->
    it "should not warn when 'is' is used in a single-quote string", ->
      expect(coffeelint.lint("'1 is 1'", configError).length).to.be.not.ok

    it "should not warn when 'is' is used in a double-quote string", ->
      expect(coffeelint.lint('"1 is 1"', configError).length).to.be.not.ok

    it "should not warn when 'is' is used in a multiline string", ->
      expect(coffeelint.lint('''
        """
        1 is 1
        """
        ''', configError).length).to.be.not.ok
