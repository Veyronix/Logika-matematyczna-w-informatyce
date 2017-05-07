tru = lambda x: lambda y: (x)
fal = lambda x: lambda y: (y)
itt = lambda i: lambda t: lambda e: (i)(t)(e)
print(itt(fal)("true")("false"))
AND = lambda x: lambda y: (x)(y)(x)
OR = lambda x: lambda y: (x)(x)(y)
NOT = lambda x: (x)(fal)(tru)

scc = lambda n: lambda f: lambda x: (f)((n)(f)(x))
c0 = lambda f: lambda x: x
c1 = scc(c0)
c2 = scc(c1)
c2 = lambda f: lambda x: (f)(f(x))
c3 = scc(c2)
c4 = scc(c3)
c5 = scc(c4)
print((c2)(lambda x: x+1)(0))
plus = lambda m: lambda n: lambda f: lambda x: (m)(f)((n)(f)(x))
print(plus(c1)(c2)(lambda n: n+1)(0))
'''mnozenie'''
times = lambda m: lambda n: (m)(plus(n))(c0)
print(times(c2)(c3)(lambda n: n+1)(0))

pred = lambda n: lambda f: lambda x: (n)(lambda g:lambda h:(h)((g)(f)))(lambda u: (x))(lambda u: (u))
print(pred(c3)(lambda n: n+1)(0))

minus= lambda m:lambda n:(n)(pred)(m)
print(minus(c3)(c0)(lambda n:n+1)(0))
IS_ZERO = lambda n: n(lambda x: fal)(tru)
'''Czy lewe jest mniejsze od prawego'''
IS_LESS_OR_EQUAL = lambda m: lambda n: IS_ZERO(minus(m)(n))
print(IS_ZERO(c1)("true")("false"))
print(IS_LESS_OR_EQUAL(c2)(c3)("true")("false"))
to_integer = lambda n: n(lambda x:(x+1))(0)
PAIR = lambda x: lambda y: lambda f: (f)(x)(y)
LEFT = lambda p: (p)(lambda x: lambda y: x)
RIGHT =lambda p: (p)(lambda x: lambda y: y)
'''nil(koniec listy)'''
EMPTY = PAIR(tru)(tru)
UNSHIFT = lambda l: lambda x: (PAIR)(fal)(PAIR(x)(l))
IS_EMPTY = LEFT
FIRST = lambda l: (LEFT)(RIGHT(l))
REST = lambda l: (RIGHT)(RIGHT(l))
my_pair= PAIR(c3)(c5)
print(LEFT(my_pair)(lambda x:x+1)(0))
my_list = UNSHIFT(UNSHIFT(UNSHIFT(EMPTY)(c3))(c2))(c1)
print(FIRST(REST(REST(my_list)))(lambda x:x+1)(0))
Z = lambda f: (lambda x: f(lambda y: x(x)(y)))(lambda x: f(lambda y: x(x)(y)))
Z = lambda f: lambda x: f(lambda y: x(x)(y))(lambda x: f(lambda y: x(x)(y)))
IF = lambda i: lambda t: lambda e: (i)(t)(e)
'''lub IF= lambda i: i'''
Z = lambda f: (lambda x: f(lambda y: x(x)(y)))(lambda x: f(lambda y: x(x)(y)))

print(IS_ZERO(c1)("true")("false"))
Y = lambda g: (lambda f: g(lambda arg: f(f)(arg)))(lambda f: g(lambda arg: f(f)(arg)))
print("STOP")
fac = lambda n: \
    IF(IS_ZERO(pred(n)))(
        n
    )(
        lambda x: times(fac(pred(n)))(n)(x)
)


'''WERSJA Y'''
suma = lambda n: \
    IF(IS_ZERO(pred(n)))(
        n
    )(
        lambda x: plus(suma(pred(n)))(n)(x)
)

suma = Z( lambda f: lambda n: \
    IF(IS_ZERO(pred(n)))(
        n
    )(
        lambda x: f(plus(suma(pred(n))))(n)(x)
    )
)

NWD = lambda a: lambda b: \
    IF(IS_LESS_OR_EQUAL(a)(b))(
        IF(IS_ZERO(minus(b)(a)))(
            a
        )(
            lambda x: NWD(a)(minus(b)(a))(x)
        )
    )(
        lambda x: NWD(minus(a)(b))(b)(x)
    )

print(to_integer(fac(c5)))
print(to_integer(suma(scc(c5))))
print((to_integer(NWD(scc(c5))(c3))))

OSTATNI = lambda l: \
    IF(IS_EMPTY(REST(l)))(
        FIRST(l)
    )(
        lambda x: OSTATNI(REST(l))(x)
    )

my_list1=UNSHIFT(EMPTY)(c3)
print(IS_EMPTY(FIRST(REST(my_list1)))("tak")("nie"))
print(to_integer(OSTATNI(my_list)))



'''Maximum w liscie'''
MAX = lambda l: lambda x: \
    IF(IS_EMPTY(l))(
        x
    )(
        IF(IS_LESS_OR_EQUAL(FIRST(l))(x))(
            lambda y: MAX(REST(l))(x)(y)
        )(
            lambda y: MAX(REST(l))(FIRST(l))(y)
        )
    )


my_list = UNSHIFT(UNSHIFT(UNSHIFT(UNSHIFT(EMPTY)(c3))(c2))(c1))(c4)
print(to_integer(MAX(my_list)(c0)))
