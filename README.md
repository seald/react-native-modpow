# react-native-modpow

Export native BigInteger.modPow() function that will not freeze your UX for more than a minute.

## Installation

```sh
npm install react-native-modpow
```

Linking:

```sh
react-native link react-native-modpow
```

## Usage

```js
import modPow from 'react-native-modpow'

const result = modPow({
  target: 2, // number
  value: 2, // power
  modifier: 3 // Congruence
})
// result = 0
```

## Usage as patch for Forge

Use this snippet to patch `BigInteger.modPow()` from node-forge. The goal is to improve Forge's performance on
React-Native significantly, in particular the generation of RSA keys.

```js
import Forge from 'node-forge'
import modPow from 'react-native-modpow'

Forge.jsbn.BigInteger.prototype.modPow = function nativeModPow (e, m) {
  const result = modPow({
    target: this.toString(16),
    value: e.toString(16),
    modifier: m.toString(16)
  })

  return new Forge.jsbn.BigInteger(result, 16)
}
```
