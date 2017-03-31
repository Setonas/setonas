# Setonas

[![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/Setonas/Lobby)

**Setonas** is a programming language created in the secret labs of Bell Labs. 

This is the first language that supports **reverse versioning**. 

Thanks to him, there is no problem with backwards compatibility.

**Setonas** in its releases is moving from version 3.4.6 to 0.0, which will be the **absolute** in programming languages.

There will not be any bugs and the language will run **faster** than the machine code.

The first release of **Setonas** is version 3.4.6, which was released on **April 1, 2017**.

It is believed that from this moment the world lives on a new calendar - 

**Before** the appearance of **Setonas** and **After** the appearance of **Setonas**.

**Setonas** is Python-based and translated into the Lithuanian language, as it is more receptive for reading.

## Facts about Setonas

- Chuck Noris writes on **Setonas**.
- When you read the **Setonas** source, **Setonas** reads you.
- In the next version planning to release **go to** with the **tail recursion**.
- Any algorithm implemeted in **Setonas** has **O(1)** time and memory complexity.
- **Setonas** is HashiCorp-ready language.

At the moment, **Setonas** is used by such gigants as:
- Google. **Setonas** outperformed Go on all benchmarks. Rob, we mourn.
- Apple. Siri rewrote herself on **Setonas**.
- Microsoft. Inspired by Apple's example, Microsoft engineers successfully installed **Setonas** in Cortana.
- Oracle. After [Tarantool killed Oracle](http://www.cnews.ru/news/top/2016-12-05_subd_mailru_tarantool_cherez_tri_nedeli_prevratitsya), they decided go to **Setonas**.

Conceptually **Setonas** very similar to other programming languages, as took the best of them.

## Try Setonas in Docker

```
docker pull setonas/setonas
docker run -it setonas/setonas
```

## Syntax example

You can simply run a **.se** file by using

```
setonas example.se
```

For education purposes lets try to understand [butelis.se](https://github.com/Setonas/butelis/blob/master/butelis.se):

```
apibrėžti WSGIHandler(aplin, pradžia_atsakymas):
    globalinis prašymas
    globalinis atsakymas
    prašymas.įpareigoti(aplin)
    atsakymas.įpareigoti()
    bandyti:
        prižiūrėtojas, argi = rungtynės_url(prašymas.kelias, prašymas.metodas)
        jei not prižiūrėtojas:
            kelti HTTPKlaida(404, "Nerastas")
        produkcija = prižiūrėtojas(**argi)
    išskyrus BreakButelio kaip antsparnis:
        produkcija = antsparnis.produkcija
    išskyrus Exception kaip išimtis:
        atsakymas.statusas = getattr(išimtis, 'http_statusas', 500)
        klaidaprižiūrėtojas = KLAIDA_HANDLER.get(atsakymas.statusas, klaida_nutylėjimą)
        bandyti:
            produkcija = klaidaprižiūrėtojas(išimtis)
        išskyrus:
            produkcija = "Išimtis per klaidos prižiūrėtojas! Prašymas sustabdyti."

        jei atsakymas.statusas == 500:
            prašymas._aplin['wsgi.errors'].write("Error (500) on '%s': %s\n" % (prašymas.kelias, išimtis))

    db.uždaryti()
    jei turiatrib(produkcija, 'read'):
        failąišvesties = produkcija
        jei 'wsgi.file_wrapper' iš aplin:
            produkcija = aplin['wsgi.file_wrapper'](failąišvesties)
        kitas:
            produkcija = iter(lambda: failąišvesties.read(8192), '')
    kijei isinstance(produkcija, stg):
        produkcija = [produkcija.encode()]

    dėl c iš atsakymas.SLAPUKAI.values():
        atsakymas.antraštė.papildyti('Set-Cookie', c.OutputString())
    statusas = '%d %s' % (atsakymas.statusas, HTTP_KODAI[atsakymas.statusas])
    pradžia_atsakymas(statusas, sąrašas(atsakymas.antraštė.daiktai()))
    sugrįžti produkcija
```

## Ecosystem

### Butelis

**Setonas** has the first web framework - [butelis](https://github.com/Setonas/butelis).

Here is an [example.se](https://github.com/Setonas/butelis/blob/master/example/example.se) with its using:

```
nuo butelis importas maršrutas, paleisti, prašymas, atsakymas, siųsti_failą, nutraukti, db, ButelisKibiras

kibiras = ButelisKibiras('kibaras1')
kibiras['mano_vardas'] = None

@maršrutas('/')
apibrėžti sveiki_pasaulis():
    jei kibiras['mano_vardas']:
        sugrįžti "Jūs buvote %s" % kibiras['mano_vardas']
    sugrįžti 'Sveiki Pasaulis!'

@maršrutas('/sveiki/:vardas')
apibrėžti sveiki_vardas(vardas):
    kibiras['mano_vardas'] = vardas
    sugrįžti 'Sveiki %s!' % vardas

@maršrutas('/sveiki', metodas='POST')
apibrėžti sveiki_paštas():
    vardas = prašymas.PAŠTAS['vardas']
    sugrįžti 'Sveiki %s!' % vardas

@maršrutas('/statinio/:failo_pavadinimas#.*#')
apibrėžti statinio_failą(failo_pavadinimas):
    siųsti_failą(failo_pavadinimas, šaknis='/path/to/static/files/')

paleisti(kariuomenė='localhost', uostas=8080)
```

### MagicSetonas

![MagicSetonas](https://camo.githubusercontent.com/a02d6f960225788c96c825022e798d6e7056e8ef/68747470733a2f2f7365746f6e61732e6769746875622e696f2f4d616769635365746f6e61732f6578616d706c652e706e67)

[MagicSetonas](https://github.com/Setonas/MagicSetonas) is used to highlight syntax in:

- Sublime Text
- Atom
- Visual Studio Code

## Language Design

Here is some language design, that you can use:

### if/else

```
if -> jei
elif -> kijei
else -> kitas
```

### def

```
def -> apibrėžti
```

### try/except/else/finally

```
try -> bandyti
except -> išskyrus
else -> kitas
finally -> pagaliau
```

### import/from/as

```
import -> importas
from -> nuo
as -> kaip
```

### raise

```
raise -> kelti
```

### return

```
return -> sugrįžti
```

### for/in

```
for -> dėl
in -> iš
```

### yield from

```
yield -> duoti
from -> nuo
```

### class

```
class -> rūšis
```

### continue/break/pass

```
continue ->tęsti
break -> pertrauka
break -> pereiti
```

### del

```
del -> pan
```

### global/nonlocal

```
global -> globalinis
nonlocal -> nelokaliosiomis
```

### assert

```
assert -> teigti
```

### while

```
while -> kol
```

### with/as

```
with -> su
as -> kaip
```

### lambda

```
lambda -> liambda
```

### property

```
property -> nuosavybė
```

### isinstance

```
isinstance -> yrainstancija
```

### getattr

```
getattr -> gautiatrib
```

### or/and/not

```
or -> arba
and -> ir
not -> nebūtų
```

### os module

```
os -> vs
os.path -> vs.kelias
os.name -> vs.vardas
os.curdir -> vs.dabkat
os.pardir -> vs.tėvųkat
os.sep -> vs.sep
os.extsep -> vs.pratsep
os.altsep -> vs.pakasep
os.pathsep -> vs.kelsep
os.linesep -> vs.linisep
os.defpath -> vs.numamarš
os.devnull -> vs.asilas
```

### int/list/object/str

```
int -> sveik
list -> sąrašas
object -> objektas
str ->stg
```

### True/False

```
True -> Tiesa
False -> Netikras
```

### None

```
None -> Joks
```

### abs/all/any

```
abs -> abs (absoliutus)
all -> visi
any -> koks
```

### sum/min/max

```
sum -> suma
min -> min (minimumas)
max -> maks
```

### next

```
next -> sekantis
```

### len/hasattr

```
len -> ilgis
hasattr -> turiatrib
```

### range/iter

```
range -> diapazonas
iter -> iter
```

### print

```
print -> spausdinti
```

### in

```
in -> iš
```

This is an April Fools' joke =)
