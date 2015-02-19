# coffeelint-prefer-symbol-operator
==================================

Forked from [https://github.com/parakeety/coffeelint-prefer-english-operator](https://github.com/parakeety/coffeelint-prefer-english-operator).

coffeelint-prefer-symbol-operator is a plugin of [coffeelint](http://www.coffeelint.org/). It checks for `is`, `isnt`, `and`, `or`, preferring instead `==`, `!=`, `&&`, `||`.

```
a is a #no
a == a #yes

a isnt a #no
a != a #yes

a and b #no
a && b #yes

a or b #no
a || b #yes

```

## How to Install

1. add `"coffeelint-prefer-symbol-operator": "0.1.0"` as `devDependencies` in `package.json`
2. `npm install`

## How to Use

In your `coffeelint.json`, add

```
{
  // other lint rules
  {
    "prefer_symbol_operator": {
      "module": "coffeelint-prefer-symbol-operator",
      "level": "error"
    }
  }
}
```

and run `coffeelint`.
