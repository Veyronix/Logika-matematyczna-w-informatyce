{-# LANGUAGE ScopedTypeVariables #-}

type A = Int
type B = Bool
type C = Float
type D = Double 


-- impl_komp (A -> B) -> (B -> C) -> A -> C --
impl_komp = \(x::A->B) -> \(y::B->C) -> \(z::A) -> y (x z) :: C

-- impl_rozdz (A -> B) -> (A -> C) -> A -> B -> C
impl_rozdz = \(x::A->B) -> \(y::A->C) -> \(w::A) -> \(z::B) -> y w :: C

-- impl_perm (A -> B -> C) -> B -> A -> C
impl_perm = \(x::A->B->C) -> \(y::B) -> \(z::A) -> (x z) y :: C

-- impl_conj : A -> B -> A /\ B
impl_conj = \(x::A) -> \(y::B) -> (x,y) :: (A,B)

-- conj_elim_l : A /\ B -> A. 
conj_elim_l = \(x::(A,B)) -> fst x :: A

-- disj_intro_l : A -> A \/ B.
disj_intro = \(x::A) -> Left x :: (Either A B)

--rozl_elim : A \/ B -> (A -> C) -> (B -> C) -> C.
rozl_elim = \(x:: Either A B) -> \(y :: A->C) -> \(z::B->C) ->(either y z) x :: C

-- diamencik : (A -> B) -> (A -> C) -> (B -> C -> D) -> A -> D.
diamencik = \(x::A->B) -> \(y::A->C) -> \(w::B->C->D) -> \(z::A) -> (w (x z)) (y z) :: D

-- slaby_peirce : ((((A -> B) -> A) -> A) -> B) -> B. przepisanie z coqa
slaby_peirce = \(x::(((A->B) -> A) -> A) -> B) -> x(\y -> y(\w-> x( \z -> w))) :: B

-- rozl_impl_rozdz : (A \/ B -> C) -> (A -> C) /\ (B -> C)

-- rozl_impl_rozdz_odw : (A -> C) /\ (B -> C) -> A \/ B -> C uzycie eleminacji alternatywy w ostatnim kroku
rozl_impl_rozdz_odw :: ((A -> C), (B -> C)) -> (Either A B) -> C 
rozl_impl_rozdz_odw = \(x::((A -> C), (B -> C))) -> \(Left y) -> (\(z::A -> C) -> \(w::B -> C) -> z y) (fst x) (snd x) :: C
rozl_impl_rozdz_odw_2 :: ((A -> C), (B -> C)) -> (Either A B) -> C
rozl_impl_rozdz_odw_2 = \(x::((A -> C), (B -> C))) -> \(Right y) -> (\(z::A -> C) -> \(w::B -> C) -> w y) (fst x) (snd x) :: C

-- curry : (A /\ B -> C) -> A -> B -> C
curry = \(x::(A,B)->C) -> \(y::A) -> \(z::B) -> x (y,z) :: C 

-- uncurry : (A -> B -> C) -> A /\ B -> C

uncurry = \(x::A->B->C) -> \(y::(A,B)) -> (x (fst y)) (snd y) :: C
