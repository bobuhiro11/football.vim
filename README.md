## football.vim

create football formation template.

### Usage


1 set formation

```
:FootballPrepare 442
```

2 set player

ex.
```
442@football.vim
FW (10.hogera) (11.hogehoge)
MF (6.bazbar) (7.hoge) (8.piyo) (9.fuga)
DF (2.bar) (3.baz) (4.foobar) (5.barbaz)
GK (1.foo)
```

3 create formation

```
:FootballCreate
```

ex.
```
|----------------------------------------------------|
|                                                    |
|                                                    |
|                 *                *                 |
|               10.hogera        11.hogehog          |
|                                                    |
|                                                    |
|            *                         *             |
|          6.bazbar                  9.fug           |
|                                                    |
|                                                    |
|                 *                *                 |
|               7.hoge           8.piyo              |
|----------------------------------------------------|
|                                                    |
|                                                    |
|            *                         *             |
|          2.bar                     5.barba         |
|                                                    |
|                                                    |
|                 *                *                 |
|               3.baz            4.foobar            |
|                                                    |
|                                                    |
|                          *                         |
|                      1.foo                         |
|----------------------------------------------------|
```
