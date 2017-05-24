(*
 * Bartosz Pietrzyk
 * Zadanie domowe 1, czesc 1
 *  structure file
 *)
structure id291522 :> PART_ONE =
struct
exception NotImplemented

  datatype 'a tree= Leaf of 'a | Node of 'a tree * 'a * 'a tree

 fun sum n = 
	if n = 1
	then 
		1
	else  
		n + sum (n-1);
		
  fun fac n = 
	if n = 1 
	then
		1
	else  
	n * fac (n-1);


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
fun sumTree(Leaf n) = n
	| sumTree ( Node (left,n,right)) = (sumTree left) + n + (sumTree right)
fun depth ( tree )=
	case tree of
	Leaf n => 0
	| Node (left,_,right)=>
		1+(fn(x,y)=>if x>y then x else y)(depth left,depth right)

  fun binSearch t x =
	case t of
	Leaf a => if a = x then true else false
	| Node(left, var , right) => 
		if var = x then true else
		if x > var then binSearch right x
else binSearch left x;

fun preorder( tree)=
	case tree of
	Leaf n => [n]
	| Node(left,n,right) =>([n] @ preorder(left)) @ preorder(right)

  fun listAdd (first:int list) [] = first
  | listAdd [] (second:int list) = second
| listAdd (first:int list as head1 :: tail1) (second:int list as head2 :: tail2) = (head1 + head2) :: listAdd tail1 tail2

fun insert m l = 
	case l of 
	nil => [m]
	| head :: tail => 
		if m < head then m :: head :: tail
		else head :: insert m tail;

  fun insort l = 
	let
	val sorted = []
	in
		case l of
		nil => sorted
		| head :: tail => insert head (insort tail)
end;





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

fun lzip (h1::tail1,h2::tail2) = [(h1,h2)] @ lzip (tail1,tail2)
  |lzip ([], _) = []
|lzip (_ ,[]) = [];

fun split [] = ([],[])
    |split [x] = ([x],[])
    |split (x1::x2::xs) = let val (x1s,x2s) = split xs
in ((x1::x1s),(x2::x2s)) end;


fun cartprod l [] = []
	| cartprod [] k = []
	| cartprod (head::tail) k = (lmap (fn y=> (head,y)) k) @ (cartprod tail k);

end





