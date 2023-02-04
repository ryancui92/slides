---
theme: default
highlighter: shiki
lineNumbers: false
drawings:
  persist: false
css: unocss
class: 'text-center'
favicon: 'https://qiniustatic.ryancui.com/meta-images/favicon.ico'
routerMode: 'hash'
title: 'How to pick names'
titleTemplate: '%s'
---

# How to pick names

---
layout: center
---

# Code is read by human

<style>
h1 {
  font-size: 2.75rem;
}
</style>

---

# Overview

1. Specific is better than abstract
2. Dos
    - Spell words correctly
    - Useful patterns
3. Don'ts
    - Useless abbreviation
    - Unnecessary words
    - Unnecessary data type

---

# Specific is better than abstract
Make things clear...

`temp`, `result`, `params`, `response`, `data` are signals.

```ts
function getData() {}
const data = getData() // WTF is data???
```

You **MUST** know what you are doing now. Business layer have their names naturely.

```ts
function fetchData() {}
function fetchConnectors() {}
```

Specific code, not specific word.

```ts
class AnimalFactory {
  public get() { /* ... */ }
}
const animalFactory = new AnimalFactory()
const panda = animalFactory.get() // Not so bad
```

---

# Specific is better than abstract
Before...

```ts
function formatMenu(list: Menu[], index: number, root?: string) {
  const arr: Menu[] = []
  index++
  list.forEach((item: Menu) => {
    if (item.parent === root) {
      item.level = index
      item.children = formatMenu(list, index, item.key)
      arr.push(item)
    }
  })
  return arr
}

formatMenu(list)
```

---

# Specific is better than abstract
After...

```ts
function getSubmenusByParent(menus: Menu[], level: number, parent?: string) {
  const children: Menu[] = []
  level++
  menus.forEach((menu: Menu) => {
    if (menu.parent === parent) {
      menu.level = level
      menu.children = getSubmenusByParent(menus, level, menu.key)
      children.push(menu)
    }
  })
  return children
}

getSubmenusByParent(menus)
```

---

# Dos: Spell words correctly
GoGoGo! Learn English...

Typos can be avoided by IDE.(JetBrains / VS Code / Vim)

```ts
function ridioChange() {}
function creatRawApp() {}

const currntApp = {}
```

A word always means something.

```ts
const projectNamespace = 'test-heven'
const projectNameSpace = 'test-heven'
```

---

# Dos: Useful patterns
Prefix some words to indicate states or actions

is/should/only + XXX + YYY

```ts
const isSubmitted = false
const isAdmin = false
const shouldNotifyUser = true
const onlyPieSeries = true
```

do/fetch/get/update/to + XXX. Actions are always started with a verb.

```ts
function doForward(a: TypeA): TypeB
function updateConfig(config: Config)
```

---

# Dos: Useful patterns
Singular form and plural form

We can use singular form and plural form to distinct a set and an item.

```ts
const city = new City()
const cities = []

for (var i = 0; i < cities.length; i++) {
  cities[i].earthquake()
}
```

---

# Dos: Useful patterns
Active voice and passive voise

Active voice usually closes to model, passive voice usually closes to view.

```ts
// passive voice
function onLogin() {} 
function onLoginButtonClick() {}

// active voice
function login() {}
function doLogin() {}
```

Prefer model instead of view, because model is more stable.

```ts
function onLoginButtonClick() {}
// Assume that: FaceID can also login?
function onFaceIDUnlock() {} // copy from onLoginButtonClick ???
```

---

# Don'ts: Useless abbreviation
Don't work like a compiler...

In most cases, shorten a word is not necessary.

```ts
const errMsg = `You DON'T have ANY privileges in this system`
```

You may need to regconize some common abbreviations.

```ts
const idx = 1
const tmp = 'Hello'
const char = 'G'
```

---

# Don'ts: Unnecessary words
Principle KISS

```ts
function handleSubmitUser() {} // handle means what?
function doLogin() {} // why do it?

const userInfoData = {}
```

---

# Don'ts: Unnecessary data type

```ts
const cityList = []
function getConnectorsList() {}
```

We should use variables/method/class based on `Interface`, not by name.

```ts
const cities: City[] = []
function getConnectors(): Connector[]
```

When you refactor your implementation, you have to change your names.

--- 

# Review

1. Specific is better than abstract
2. Dos
    - Spell words correctly
    - Useful patterns
3. Don'ts
    - Useless abbreviation
    - Unnecessary words
    - Unnecessary data type
