fun sum n=
    if n = 1 then 1
    else n + sum ( n - 1)
 
fun silnia n=
    if n = 0 then 1
    else n*silnia(n-1)
 
fun fib n=
    if n < 2 then 1
    else fib (n-1) + fib(n-2)
 
fun gcd (x,y)=
    if x=y then x
    else if x>y then gcd(x-y,y)
    else gcd (x,y-x);
 
fun program (x : int list,y : int)=
    if null x then y
    else if (hd x) >y then  program(tl x,hd x)
    else program(tl x,y);
fun max(x : int list)=
    program(x,0)
 
datatype tree =
    Leaf of int
    | Node of tree * int * tree;
fun sum(Leaf n) = n
    | sum ( Node (left,n,right)) = (sum left) + n + (sum right)
 
 
fun dep ( tree )=
    case tree of
    Leaf n => 0
    | Node (left,_,right)=>
        1+(fn(x,y)=>if x>y then x else y)(dep left,dep right)
fun binSearch(tree ,x:int)=
    case tree of
    Leaf n=> if n==x then true else false
    | Node(left,n,right)=>
        (fn(a,b)=> if a>b then binSearch(left,x) else binSearch(right,x))(n,x)
fun preorder( tree)=
    case tree of
    Leaf n => [n]
    | Node(left,n,right) =>([n] @ preorder(left)) @ preorder(right)
 
fun listAdd ([],b:int list)=b
    |listAdd (a:int list,[]) =a
    | listAdd ((a:int list),(b:int list))=
        (hd a + hd b) :: listAdd(tl a,tl b)
 
fun insert ([], x:int)=[x]
    | insert (l: int list,x:int)=
        if x<hd l then x :: l
        else hd l :: insert(tl l, x)
 
 
 
fun insort( [] ) = []
    | insort([x])=[x]
    | insort( x::y)=
        insert(insort(y),x)
 
 
 
 
fun compose f g = (fn x=> g (f x))
fun curry uncurry x y = uncurry(x,y)
 
 
fun uncurry curry (x,y)=curry x y
 
 
fun multifun f n =
        if n = 1 then (fn x => f x)
else (fn x =>f ( (multifun f (n-1)) x ))
 
fun ltake l 0 = []
    | ltake [] n = []
    | ltake (head::tail) n = head :: ltake tail (n-1)
 
fun lall f [] = true
    | lall f (head :: tail) =
        if f head then lall f tail else false
 
fun lmap f []=[]
    | lmap f (head::tail)= f head :: lmap f tail
 
fun lrev [] = []
    | lrev (head :: tail )= lrev tail @ [head]
 
fun lzip l [] = []
    | lzip [] k=[]
    | lzip l k = (hd l, hd k) :: (lzip (tl l) (tl k))
fun split [] = ([],[])
    |split [x] = ([x],[])
    |split (x1::x2::xs) = let val (x1s,x2s) = split xs
in ((x1::x1s),(x2::x2s)) end;
 
 
fun cartprod l [] = []
    | cartprod [] k = []

        | cartprod (head::tail) k = (lmap (fn y=> (head,y)) k) @ (cartprod tail k);
